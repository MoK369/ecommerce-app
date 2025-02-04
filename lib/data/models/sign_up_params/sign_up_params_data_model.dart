/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuti@gmail.com"
/// password : "Ahmed@123"
/// rePassword : "Ahmed@123"
/// phone : "01010700701"

class SignUpParamsDataModel {
  SignUpParamsDataModel({
      this.name, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phone,});

  SignUpParamsDataModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}