class ErrorModel {
  String? statusMsg;
  String? errorMessage;
  ErrorModel({
    this.statusMsg,
    this.errorMessage,
  });

  ErrorModel.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    errorMessage = json['message'];
  }
}
