import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_event.dart';
part 'pick_image_state.dart';

class PickImageBloc extends Bloc<PickImageEvent, PickImageState> {
  PickImageBloc() : super(PickImageInitial()) {
    on<GalleryButtonTapped>(onGalleryButtonTapped);
    on<CameraButtonTapped>(onCameraButtonTapped);
  }

  void onGalleryButtonTapped(
      PickImageEvent event, Emitter<PickImageState> emit) async {
    final picker = ImagePicker();

    final pickerFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickerFile != null) {
      emit(ImageFileLoaded(imageFile: pickerFile));
      emit(ImagePathLoaded(imagePath: pickerFile.path));
    }
  }

  void onCameraButtonTapped(
      PickImageEvent event, Emitter<PickImageState> emit) async {
    final picker = ImagePicker();

    final pickerFile = await picker.pickImage(source: ImageSource.camera);

    if (pickerFile != null) {
      emit(ImageFileLoaded(imageFile: pickerFile));
      emit(ImagePathLoaded(imagePath: pickerFile.path));
    }
  }
}
