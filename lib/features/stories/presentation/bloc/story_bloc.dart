import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/core/common/story_entity.dart';
import 'package:story_app_flutter/features/stories/domain/usecases/get_stories_usecase.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStoriesUsecase _getStoriesUsecase;

  StoryBloc(
    this._getStoriesUsecase,
  ) : super(StoryLoading()) {
    on<GetStories>(onGetStories);
  }

  final List<StoryEntity> _stories = [];
  int _page = 1;
  final int _pageSize = 10;

  void onGetStories(StoryEvent event, Emitter<StoryState> emit) async {
    final storiesData = await _getStoriesUsecase.storyRepository.getStories(
      page: _page,
      size: _pageSize,
    );

    if (storiesData.isRight && storiesData.right.listStory.isNotEmpty) {
      final stories = storiesData.right.listStory;
      final noMoreData = stories.length < _pageSize;

      _stories.addAll(stories);
      _page++;

      emit(StoriesLoaded(storiesList: _stories, noMoreData: noMoreData));
    }

    if (storiesData.isLeft) {
      emit(StoryError(message: storiesData.left.message));
    }
  }
}
