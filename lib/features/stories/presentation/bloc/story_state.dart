part of 'story_bloc.dart';

sealed class StoryState extends Equatable {
  final List<StoryEntity>? storiesList;
  final String? message;
  final bool? noMoreData;

  const StoryState({this.message, this.storiesList, this.noMoreData});

  @override
  List<Object?> get props => [message, storiesList, noMoreData];
}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StoriesLoaded extends StoryState {
  const StoriesLoaded({super.storiesList, super.noMoreData});
}

final class StoryError extends StoryState {
  const StoryError({super.message});
}
