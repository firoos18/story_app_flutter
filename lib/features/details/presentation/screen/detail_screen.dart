import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:story_app_flutter/features/details/presentation/bloc/story_details_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:geocoding/geocoding.dart' as geo;

class DetailScreen extends StatefulWidget {
  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? address;
  LatLng? latLng;
  final Set<Marker> markers = {};

  @override
  void initState() {
    context.read<StoryDetailsBloc>().add(GetStoryDetails(id: widget.id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: BlocBuilder<StoryDetailsBloc, StoryDetailsState>(
        builder: (context, state) {
          if (state is StoryLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is StoryLoaded) {
            if (state.story!.lat != null && state.story!.lon != null) {
              latLng = LatLng(state.story!.lat!, state.story!.lon!);

              getAddressInformation(latLng!.latitude, latLng!.longitude);

              final marker = Marker(
                markerId: const MarkerId("storyMarker"),
                position: latLng!,
              );
              markers.add(marker);
            }

            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: state.story!.photoUrl,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Ionicons.alert,
                        ),
                        width: double.infinity,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.story!.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              timeago.format(
                                DateTime.parse(state.story!.createdAt),
                              ),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.story!.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        if (state.story!.lat != null &&
                            state.story!.lon != null)
                          const SizedBox(height: 16),
                        if (state.story!.lat != null &&
                            state.story!.lon != null)
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: GoogleMap(
                                initialCameraPosition:
                                    CameraPosition(target: latLng!, zoom: 14),
                                markers: markers,
                                zoomControlsEnabled: false,
                                zoomGesturesEnabled: false,
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  void getAddressInformation(double lat, double lng) async {
    final LatLng latLng = LatLng(lat, lng);

    final addressInfo =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = addressInfo[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    defineMarker(latLng, street, address);
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("storyAddress"),
      position: latLng,
      infoWindow: InfoWindow(title: street, snippet: address),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}
