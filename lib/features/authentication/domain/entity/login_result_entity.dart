import 'package:equatable/equatable.dart';

class LoginResultEntity extends Equatable {
  final String userId;
  final String name;
  final String token;

  const LoginResultEntity({
    required this.name,
    required this.token,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        name,
        token,
        userId,
      ];
}
