import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:story_app_flutter/core/common/common.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_entity.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/add_story/add_story_bloc.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/location_picker/location_picker_bloc.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/pick_image/pick_image_bloc.dart';
import 'package:story_app_flutter/features/stories/presentation/bloc/story_bloc.dart';

class AddStoryScreenFree extends StatefulWidget {
  const AddStoryScreenFree({super.key});

  @override
  State<AddStoryScreenFree> createState() => _AddStoryScreenFreeState();
}

class _AddStoryScreenFreeState extends State<AddStoryScreenFree> {
  final TextEditingController descriptionController = TextEditingController();
  File? photo;
  LatLng? location;
  String? myStreet;

  @override
  void initState() {
    context.read<LocationPickerBloc>().add(OnScreenOpened());
    super.initState();
  }

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
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          AppLocalizations.of(context)!.addLocationSnackbar),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child:
                        Text(AppLocalizations.of(context)!.addLocationButton),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final String description = descriptionController.text.trim();

                  if (location != null) {
                    final storyData = AddStoryEntity(
                      description: description,
                      photo: photo,
                      lat: location!.latitude.toDouble(),
                      lon: location!.longitude.toDouble(),
                    );

                    context
                        .read<AddStoryBloc>()
                        .add(PostStoryButtonTapped(addStoryEntity: storyData));
                  } else {
                    final storyData = AddStoryEntity(
                      description: description,
                      photo: photo!,
                      lon: null,
                      lat: null,
                    );

                    context
                        .read<AddStoryBloc>()
                        .add(PostStoryButtonTapped(addStoryEntity: storyData));
                  }
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
                      context.read<StoryBloc>().add(const GetStories());
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
}
