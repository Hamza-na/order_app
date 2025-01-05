class ErrorModel {
  final String ?exepiton;
  final String errorMessage;

  ErrorModel({ this.exepiton, required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["message"],
      exepiton: jsonData["exception"],
    );
  }
}
