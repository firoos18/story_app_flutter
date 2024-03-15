import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:story_app_flutter/core/common/common.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/location_picker/location_picker_bloc.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  LatLng? currentLocation;

  late GoogleMapController mapController;

  late final Set<Marker> markers = {};

  geo.Placemark? placemark;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mapPickerAppbarTitle),
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<LocationPickerBloc>()
                  .add(PickLocationFromMap(mapLocation: currentLocation));
              context.pop();
            },
            child: Text(AppLocalizations.of(context)!.doneAction),
          ),
        ],
      ),
      body: currentLocation != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 18,
              ),
              onLongPress: (LatLng latLng) => onLongPressGoogleMap(latLng),
              markers: markers,
              myLocationEnabled: true,
            )
          : const Center(child: Icon(Ionicons.map)),
    );
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      currentLocation = latLng;
      placemark = place;
    });

    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  void getCurrentLocation() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    setState(() {
      currentLocation = latLng;
    });
  }
}
