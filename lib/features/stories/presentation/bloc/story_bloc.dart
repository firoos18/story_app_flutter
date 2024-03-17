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
  int? page = 1;
  final int _pageSize = 10;

  void onGetStories(StoryEvent event, Emitter<StoryState> emit) async {
    if (event.isScreenOpened != null && !event.isScreenOpened!) {
      if (page != null) {
        final storiesData = await _getStoriesUsecase.storyRepository.getStories(
          page: page!,
          size: _pageSize,
        );

        storiesData.fold(
          (left) {
            emit(StoryError(message: storiesData.left.message));
          },
          (right) {
            final stories = storiesData.right.listStory;
            final noMoreData = stories!.length < _pageSize;

            _stories.addAll(stories);

            if (noMoreData) {
              page = null;
            } else {
              page = page! + 1;
            }

            emit(StoriesLoaded(storiesList: List.from(_stories)));
          },
        );
      }
    } else {
      _stories.clear();

      final storiesData = await _getStoriesUsecase.storyRepository.getStories(
        page: 1,
        size: _pageSize,
      );

      storiesData.fold(
        (left) {
          emit(StoryError(message: storiesData.left.message));
        },
        (right) {
          final stories = storiesData.right.listStory;
          final noMoreData = stories!.length < _pageSize;

          _stories.addAll(stories);

          if (noMoreData) {
            page = null;
          } else {
            page = page! + 1;
          }

          emit(StoriesLoaded(storiesList: List.from(_stories)));
        },
      );
    }
  }
}
