import 'package:equatable/equatable.dart';

class RegisterResponseEntity extends Equatable {
  final bool error;
  final String message;

  const RegisterResponseEntity({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [
        error,
        message,
      ];
}
