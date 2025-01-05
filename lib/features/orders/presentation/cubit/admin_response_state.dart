class AdminResponseState {}

final class AdminResponseInitual extends AdminResponseState{}

final class AdminResponseSuccessfully extends AdminResponseState {
  final String message;

  AdminResponseSuccessfully(this.message); 
}
final class AdminResponseFailure extends AdminResponseState {
  final String errMessage;

  AdminResponseFailure(this.errMessage);
}