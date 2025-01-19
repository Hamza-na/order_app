class ErrorModel {

  final String errorMessage;
  final String arErrorMessage;

  ErrorModel({required this.errorMessage,required this.arErrorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["error"],
      arErrorMessage: jsonData["خطأ"],
     
    );
  }
}
