import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/features/details/domain/usecases/get_story_details_usecase.dart';
import 'package:story_app_flutter/core/common/story_entity.dart';

part 'story_details_event.dart';
part 'story_details_state.dart';

class StoryDetailsBloc extends Bloc<StoryDetailsEvent, StoryDetailsState> {
  final GetStoryDetailsUsecase _getStoryDetailsUsecase;

  StoryDetailsBloc(this._getStoryDetailsUsecase)
      : super(StoryDetailsInitial()) {
    on<GetStoryDetails>(onGetStoryDetails);
  }

  void onGetStoryDetails(
      StoryDetailsEvent event, Emitter<StoryDetailsState> emit) async {
    emit(StoryLoading());

    final storyDetailsData = await _getStoryDetailsUsecase
        .storyDetailsRepository
        .getStoryDetails(event.id!);

    storyDetailsData.fold(
      (left) => emit(StoryError(message: left.message)),
      (right) => emit(StoryLoaded(story: right.story)),
    );
  }
}
