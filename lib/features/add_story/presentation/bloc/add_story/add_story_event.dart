part of 'add_story_bloc.dart';

sealed class AddStoryEvent extends Equatable {
  final AddStoryEntity? addStoryEntity;

  const AddStoryEvent({this.addStoryEntity});

  @override
  List<Object?> get props => [addStoryEntity];
}

final class PostStoryButtonTapped extends AddStoryEvent {
  const PostStoryButtonTapped({super.addStoryEntity});
}
