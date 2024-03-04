import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_entity.dart';
import 'package:story_app_flutter/features/add_story/domain/usecases/add_story_usecase.dart';

part 'add_story_event.dart';
part 'add_story_state.dart';

class AddStoryBloc extends Bloc<AddStoryEvent, AddStoryState> {
  final AddStoryUsecase _addStoryUsecase;

  AddStoryBloc(this._addStoryUsecase) : super(AddStoryInitial()) {
    on<PostStoryButtonTapped>(onPostStoryButtonTapped);
  }

  void onPostStoryButtonTapped(
      AddStoryEvent event, Emitter<AddStoryState> emit) async {
    emit(AddStoryLoading());

    if (event.addStoryEntity != null) {
      final data = await _addStoryUsecase.addStoryRepository
          .postStory(event.addStoryEntity!);

      data.fold(
        (left) => emit(AddStoryError(message: left.message)),
        (right) => emit(AddStorySuccess(message: right.message)),
      );
    } else {
      return null;
    }
  }
}
