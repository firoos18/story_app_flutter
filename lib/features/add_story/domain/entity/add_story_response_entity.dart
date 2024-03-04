import 'package:equatable/equatable.dart';

class AddStoryResponseEntity extends Equatable {
  final bool error;
  final String message;

  const AddStoryResponseEntity(this.error, this.message);

  @override
  List<Object?> get props => [
        error,
        message,
      ];
}
