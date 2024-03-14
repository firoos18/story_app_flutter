import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:location/location.dart';
import 'package:story_app_flutter/core/common/common.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_entity.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/add_story/add_story_bloc.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/pick_image/pick_image_bloc.dart';
import 'package:story_app_flutter/features/stories/presentation/bloc/story_bloc.dart';
import 'package:geocoding/geocoding.dart' as geo;

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  final TextEditingController descriptionController = TextEditingController();
  File? photo;
  LatLng? myLocation;
  String? myStreet;

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addStoryAppBarTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: BlocBuilder<PickImageBloc, PickImageState>(
                  builder: (context, state) {
                    if (state is ImagePathLoaded) {
                      photo = File(state.imagePath!);

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(state.imagePath.toString()),
                          fit: BoxFit.cover,
                        ),
                      );
                    }

                    return const Icon(
                      Ionicons.image,
                      size: 56,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<PickImageBloc>().add(CameraButtonTapped());
                    },
                    icon: const Icon(Ionicons.camera),
                    label: Text(AppLocalizations.of(context)!.cameraPhoto),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<PickImageBloc>().add(GalleryButtonTapped());
                    },
                    icon: const Icon(Ionicons.images),
                    label: Text(AppLocalizations.of(context)!.galleryPhoto),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.description,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  autofocus: false,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  getCurrentLocation();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(myStreet != null ? myStreet! : "Add Location"),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final String description = descriptionController.text.trim();

                  final storyData =
                      AddStoryEntity(description, photo!, null, null);

                  context
                      .read<AddStoryBloc>()
                      .add(PostStoryButtonTapped(addStoryEntity: storyData));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: BlocConsumer<AddStoryBloc, AddStoryState>(
                  listener: (context, state) {
                    if (state is AddStorySuccess) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              AppLocalizations.of(context)!.storyPostedAlert),
                        ),
                      );
                      context.read<StoryBloc>().add(GetStories());
                      context.goNamed('home');
                    } else if (state is AddStoryError) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message!),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddStoryLoading) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }

                    return Text(
                      AppLocalizations.of(context)!.postButton,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    /// todo-02-07: check the location service
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }

    /// todo-02-08: check the location permission
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);
    final addressInfo =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = addressInfo[0];
    final street = place.administrativeArea;

    print(latLng);
    print(street);

    setState(() {
      myLocation = latLng;
      myStreet = street;
    });
  }

  void getLocationFromMap() {}
}
