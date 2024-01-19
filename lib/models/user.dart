import 'dart:convert';

class User {
  String? id;
  String name;
  String lastname;
  String username;
  String? phone;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.username,
    this.phone,
    this.email,
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
        lastname: json["lastname"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        password: json["password"] ?? '',
        passwordConfirmation: json["passwordConfirmation"] ?? '',
        emailVerifiedAt: json["email_verified_at"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "username": username,
    // "email": email,
    "password": password,
    "passwordConfirmation": passwordConfirmation,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  User copy() => User(
    name: name, 
    lastname: lastname, 
    username: username,
    password: password,
    passwordConfirmation: passwordConfirmation,
  );
}
