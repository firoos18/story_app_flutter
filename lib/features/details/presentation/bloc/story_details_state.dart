part of 'story_details_bloc.dart';

sealed class StoryDetailsState extends Equatable {
  final StoryEntity? story;
  final String? message;

  const StoryDetailsState({this.story, this.message});

  @override
  List<Object?> get props => [story, message];
}

final class StoryDetailsInitial extends StoryDetailsState {}

final class StoryInitial extends StoryDetailsState {}

final class StoryLoading extends StoryDetailsState {}

final class StoryLoaded extends StoryDetailsState {
  const StoryLoaded({super.story});
}

final class StoryError extends StoryDetailsState {
  const StoryError({super.message});
}
