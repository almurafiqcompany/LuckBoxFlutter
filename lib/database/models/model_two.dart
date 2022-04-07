import 'dart:convert';

UserRegisterModel userFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));
String userModelToJson(UserRegisterModel data) => json.encode(data.toJson());


class UserRegisterModel {
  bool? status;
  User? user;
  String? message;
  String? token;

  UserRegisterModel({this.status,required this.user, this.message,required this.token});

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  String? governate;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.name,
        this.email,
        this.phone,
        this.governate,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    governate = json['governate'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['governate'] = this.governate;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}