import 'dart:convert';

UserModel userFromJson(String str) => UserModel.toObject(json.decode(str));

class UserModel {
  User user;
  String token;

  UserModel({required this.user, required this.token});

  factory UserModel.toObject(Map<String, dynamic> json) => UserModel(
        user: User.toObject(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  int id;
  String name;
  String email;
  String phone;
  String city;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.city});

  factory User.toObject(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      city: json['city']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "city": city,
      };
}

/*
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  User user;
  String token;

  UserModel({required this.user, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(user: User.fromJson(json["user"]), token: json['token']);
}

class User {
  String name;
  String email;
  String password;

  User({required this.name, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json["name"], email: json['email'], password: json['password']);

Map<String, dynamic> toJson() =>
    {
      "name": name,
      "email": email,
      "password": password
    };



}*/
