part of 'pick_image_bloc.dart';

sealed class PickImageState extends Equatable {
  final String? imagePath;
  final XFile? imageFile;

  const PickImageState({this.imageFile, this.imagePath});

  @override
  List<Object?> get props => [
        imageFile,
        imagePath,
      ];
}

final class PickImageInitial extends PickImageState {}

final class ImageError extends PickImageState {}

final class ImagePathLoaded extends PickImageState {
  const ImagePathLoaded({super.imagePath});
}

final class ImageFileLoaded extends PickImageState {
  const ImageFileLoaded({super.imageFile});
}
