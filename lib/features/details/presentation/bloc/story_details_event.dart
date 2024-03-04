part of 'story_details_bloc.dart';

sealed class StoryDetailsEvent extends Equatable {
  final String? id;

  const StoryDetailsEvent({this.id});

  @override
  List<Object?> get props => [id];
}

final class GetStoryDetails extends StoryDetailsEvent {
  const GetStoryDetails({super.id});
}
