class ErrorModel {
  final int status;
  final dynamic errors;
  final String errorMessage;

  ErrorModel(
      {required this.status, required this.errorMessage, this.errors = ""});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["message"],
      status: jsonData["status"],
      errors: jsonData["errors"],
    );
  }
}
