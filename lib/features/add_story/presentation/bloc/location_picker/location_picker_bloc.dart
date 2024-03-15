import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

part 'location_picker_event.dart';
part 'location_picker_state.dart';

class LocationPickerBloc
    extends Bloc<LocationPickerEvent, LocationPickerState> {
  LocationPickerBloc() : super(LocationPickerInitial()) {
    on<PickCurrentLocation>(onPickCurrentLocation);
    on<PickLocationFromMap>(onPickLocationFromMap);
    on<OnScreenOpened>(onScreenOpened);
  }

  void onPickLocationFromMap(
      LocationPickerEvent event, Emitter<LocationPickerState> emit) async {
    emit(LocationPickerLoading());

    if (event.mapLocation != null) {
      final latLng =
          LatLng(event.mapLocation!.latitude, event.mapLocation!.longitude);
      final addressInfo =
          await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      final place = addressInfo[0];
      final region = place.administrativeArea;

      print(region);

      emit(LocationPickerLoaded(
        coordinates: event.mapLocation,
        address: region,
      ));
    } else {
      emit(const LocationPickerError(message: "An Unknown Error Occured!"));
    }
  }

  void onPickCurrentLocation(
      LocationPickerEvent event, Emitter<LocationPickerState> emit) async {
    emit(LocationPickerLoading());

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
    final addressInfo =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = addressInfo[0];
    final region = place.administrativeArea;

    if (locationData.latitude != null && locationData.longitude != null) {
      emit(LocationPickerLoaded(coordinates: latLng, address: region));
    } else {
      emit(const LocationPickerError(message: "An Unknown Error Occured"));
    }
  }

  void onScreenOpened(
      LocationPickerEvent event, Emitter<LocationPickerState> emit) {
    emit(LocationPickerInitial());
  }
}
