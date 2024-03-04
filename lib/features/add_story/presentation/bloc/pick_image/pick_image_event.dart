part of 'pick_image_bloc.dart';

sealed class PickImageEvent extends Equatable {
  const PickImageEvent();

  @override
  List<Object> get props => [];
}

final class CameraButtonTapped extends PickImageEvent {}

final class GalleryButtonTapped extends PickImageEvent {}
