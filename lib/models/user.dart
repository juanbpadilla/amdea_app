import 'dart:convert';

class User {
  String? id;
  String name;
  String email;
  String? password;
  String? passwordConfirmation;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    required this.name,
    required this.email,
    this.password,
    this.passwordConfirmation,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        password: json["password"] ?? '',
        passwordConfirmation: json["passwordConfirmation"] ?? '',
        emailVerifiedAt: json["email_verified_at"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "passwordConfirmation": passwordConfirmation,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  User copy() => User(
    name: name, 
    email: email,
    password: password,
    passwordConfirmation: passwordConfirmation,
  );
}
