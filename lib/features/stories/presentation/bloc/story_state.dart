part of 'story_bloc.dart';

sealed class StoryState extends Equatable {
  final List<StoryEntity>? storiesList;
  final String? message;

  const StoryState({this.message, this.storiesList});

  @override
  List<Object?> get props => [message, storiesList];
}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StoriesLoaded extends StoryState {
  const StoriesLoaded({super.storiesList});
}

final class StoryError extends StoryState {
  const StoryError({super.message});
}
