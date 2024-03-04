class RegisterModel {
  final String email;
  final String name;
  final String password;

  const RegisterModel({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
