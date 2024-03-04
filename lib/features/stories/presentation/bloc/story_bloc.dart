import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/features/stories/domain/entity/story_entity.dart';
import 'package:story_app_flutter/features/stories/domain/usecases/get_stories_usecase.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStoriesUsecase _getStoriesUsecase;

  StoryBloc(
    this._getStoriesUsecase,
  ) : super(StoryInitial()) {
    on<GetStories>(onGetStories);
  }

  void onGetStories(StoryEvent event, Emitter<StoryState> emit) async {
    emit(StoryLoading());

    final storiesData = await _getStoriesUsecase.storyRepository.getStories();

    storiesData.fold(
      (left) => emit(StoryError(message: left.message)),
      (right) => emit(StoriesLoaded(storiesList: right.listStory)),
    );
  }
}
