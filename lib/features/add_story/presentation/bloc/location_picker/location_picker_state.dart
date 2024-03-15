part of 'location_picker_bloc.dart';

sealed class LocationPickerState extends Equatable {
  final String? message;
  final LatLng? coordinates;
  final String? address;

  const LocationPickerState({this.message, this.coordinates, this.address});

  @override
  List<Object?> get props => [message, coordinates, address];
}

final class LocationPickerInitial extends LocationPickerState {}

final class LocationPickerLoading extends LocationPickerState {}

final class LocationPickerLoaded extends LocationPickerState {
  const LocationPickerLoaded({super.coordinates, super.address});
}

final class LocationPickerError extends LocationPickerState {
  const LocationPickerError({super.message});
}
