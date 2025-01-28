/// email : "samy1@gmail.com"
/// password : "samy@123"

class SignInParamsDataModel {
  SignInParamsDataModel({
      this.email, 
      this.password,});

  SignInParamsDataModel.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}