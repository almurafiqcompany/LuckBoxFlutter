// import 'dart:convert';
//
//
// UserModel userFromJson(String str) => UserModel.toObject(json.decode(str));
//
// class UserModel {
//   User user;
//   String token;
//   String message;
//   bool status;
//
//   UserModel( {required this.user, required this.token , required this.message , required this.status});
//
//   factory UserModel.toObject(Map<String, dynamic> json) =>
//       UserModel(
//         user: User.toObject(json['user']),
//         token: json['token'],
//         message: json['message'],
//         status: json['status'],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "user" : user.toJson(),
//     "token" : token,
//     "message" : message,
//     "status" : status,
//   };
// }
//
// class User {
//   int id;
//   String name;
//   String email;
//   String password;
//   String phone;
//   String governate;
//
//   User({required this.id,
//     required this.name,
//     required this.email ,
//     required this.password,
//     required this.phone ,
//     required this.governate});
//
//   factory User.toObject(Map<String, dynamic> json) =>
//       User(
//           id: json['id'],
//           name: json['name'],
//           email: json['email'],
//           password: json['password'],
//           phone: json['phone'],
//           governate: json['governate']
//       );
//
//   Map<String, dynamic> toJson() => {
//     "id" : id,
//     "name" : name,
//     "email" : email,
//     "password" : password,
//     "phone" : phone,
//     "governate" : governate,
//   };
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// /*
// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
// String userModelToJson(UserModel data) => json.encode(data.toJson());
// class UserModel {
//   User user;
//   String token;
//   UserModel({required this.user, required this.token});
//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       UserModel(user: User.fromJson(json["user"]), token: json['token']);
// }
// class User {
//   String name;
//   String email;
//   String password;
//   User({required this.name, required this.email, required this.password});
//   factory User.fromJson(Map<String, dynamic> json) =>
//       User(name: json["name"], email: json['email'], password: json['password']);
// Map<String, dynamic> toJson() =>
//     {
//       "name": name,
//       "email": email,
//       "password": password
//     };
// }*/