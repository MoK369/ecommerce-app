import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';

/// message : "success"
/// user : {"name":"samy","email":"samy1@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDIyZGEwZjlkNDk2Nzc4MmEyNTQxYSIsIm5hbWUiOiJzYW15Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzgwNjkwOTYsImV4cCI6MTc0NTg0NTA5Nn0.9Fm4bOiPHvPOOVzcA9KLNV1cB5bj1UcA3sueYA3eOTk"

class AuthenticationDataModelDto {
  AuthenticationDataModelDto({
    this.message,
    this.user,
    this.token,
  });

  AuthenticationDataModelDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDataDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDataDto? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthenticationDataModel convertToAuthenticationDataModel() {
    return AuthenticationDataModel(
        message: message,
        user: user?.convertToUserData(),
        token: token);
  }
}

/// name : "samy"
/// email : "samy1@gmail.com"
/// role : "user"

class UserDataDto {
  UserDataDto({
    this.name,
    this.email,
    this.role,
  });

  UserDataDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserData convertToUserData() {
    return UserData(email: email, name: name, role: role);
  }
}
