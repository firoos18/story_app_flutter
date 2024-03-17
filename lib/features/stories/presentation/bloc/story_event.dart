part of 'story_bloc.dart';

sealed class StoryEvent extends Equatable {
  final bool? isScreenOpened;

  const StoryEvent({this.isScreenOpened});

  @override
  List<Object?> get props => [isScreenOpened];
}

final class GetStories extends StoryEvent {
  const GetStories({super.isScreenOpened});
}
