part of 'location_picker_bloc.dart';

sealed class LocationPickerEvent extends Equatable {
  final LatLng? mapLocation;

  const LocationPickerEvent({this.mapLocation});

  @override
  List<Object?> get props => [mapLocation];
}

final class PickLocationFromMap extends LocationPickerEvent {
  const PickLocationFromMap({super.mapLocation});
}

final class PickCurrentLocation extends LocationPickerEvent {}

final class OnScreenOpened extends LocationPickerEvent {}
