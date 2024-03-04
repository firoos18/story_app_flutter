part of 'story_bloc.dart';

sealed class StoryEvent extends Equatable {
  final String? id;

  const StoryEvent({this.id});

  @override
  List<Object?> get props => [id];
}

final class GetStories extends StoryEvent {}
