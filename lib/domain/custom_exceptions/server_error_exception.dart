class ServerErrorException implements Exception {
  String statusMsg;
  String message;

  ServerErrorException({required this.statusMsg, required this.message});
}
