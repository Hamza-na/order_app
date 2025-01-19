class AdminResponseState {}

final class AdminResponseInitual extends AdminResponseState{}

final class AdminResponseSuccessfully extends AdminResponseState {
  final String message;

  AdminResponseSuccessfully(this.message); 
}
final class AdminResponseFailure extends AdminResponseState {
  final String errMessage;
  final String arErrMessage;

  AdminResponseFailure({required this.errMessage, required this.arErrMessage});
}