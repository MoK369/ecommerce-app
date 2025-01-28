/// message : "success"
/// user : {"name":"samy","email":"samy1@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDIyZGEwZjlkNDk2Nzc4MmEyNTQxYSIsIm5hbWUiOiJzYW15Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzgwNjkwOTYsImV4cCI6MTc0NTg0NTA5Nn0.9Fm4bOiPHvPOOVzcA9KLNV1cB5bj1UcA3sueYA3eOTk"

class AuthenticationDataModel {
  AuthenticationDataModel({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  User? user;
  String? token;
}

/// name : "samy"
/// email : "samy1@gmail.com"
/// role : "user"

class User {
  User({
    this.name,
    this.email,
    this.role,
  });

  String? name;
  String? email;
  String? role;
}
