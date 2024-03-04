part of 'add_story_bloc.dart';

sealed class AddStoryState extends Equatable {
  final String? message;

  const AddStoryState({this.message});

  @override
  List<Object?> get props => [message];
}

final class AddStoryInitial extends AddStoryState {}

final class AddStoryLoading extends AddStoryState {}

final class AddStorySuccess extends AddStoryState {
  const AddStorySuccess({super.message});
}

final class AddStoryError extends AddStoryState {
  const AddStoryError({super.message});
}
