part of 'admin_cubit.dart';


class AdminState {}

final class ToUserInitial extends AdminState {}



final class ToUserLoading extends AdminState {}
final class ToUserSuccessfully extends AdminState {
  //final String message;

  ToUserSuccessfully(
    //this.message
    ); 
}
final class UploadImageSuccessfully extends AdminState{
}
final class ToUserFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  ToUserFailure({required this.errMessage, required this.arErrMessage});
}

final class ToAdminLoading extends AdminState {}
final class ToAdminSuccessfully extends AdminState {
  //final String message;

  ToAdminSuccessfully(
   // this.message
    ); 
}
final class ToAdminFailure extends AdminState {
 final String errMessage;
  final String arErrMessage;

  ToAdminFailure({required this.errMessage, required this.arErrMessage});
}


final class AdminResponseSuccessfully extends AdminState {
  //final String message;

  AdminResponseSuccessfully(
    //this.message
    ); 
}
final class AdminResponseFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  AdminResponseFailure({required this.errMessage, required this.arErrMessage});
}

final class CreateMarketLoading extends AdminState {}
final class CreateMarketSuccessfully extends AdminState {
  

  CreateMarketSuccessfully(); 
}
final class CreateMarketFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  CreateMarketFailure({required this.errMessage, required this.arErrMessage});
}
final class UpdateMarketLoading extends AdminState {}
final class UpdateMarketSuccessfully extends AdminState {

  UpdateMarketSuccessfully(); 
}
final class UpdateMarketFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  UpdateMarketFailure({required this.errMessage, required this.arErrMessage});
}
final class DeleteMarketLoading extends AdminState {}
final class DeleteMarketSuccessfully extends AdminState {
  //final String message;

  DeleteMarketSuccessfully(); 
}
final class DeleteMarketFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  DeleteMarketFailure({required this.errMessage, required this.arErrMessage});
}


final class AdminNotificationLoading extends AdminState {}
final class AdminNotificationSuccessfully extends AdminState {
  //final String message;

  NotificationResponseModel notificationResponseModel;

  AdminNotificationSuccessfully(this.notificationResponseModel); 
}
final class AdminNotificationFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  AdminNotificationFailure({required this.errMessage, required this.arErrMessage});
}


final class CreateProductLoading extends AdminState {}
final class CreateProductSuccessfully extends AdminState {
 // final String message;

  CreateProductSuccessfully(
   // this.message
    ); 
}
final class CreateProductFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  CreateProductFailure({required this.errMessage, required this.arErrMessage});
}
final class UpdateProductLoading extends AdminState {}
final class UpdateProductSuccessfully extends AdminState {
  //final String message;

  UpdateProductSuccessfully(
    //this.message
    ); 
}
final class UpdateProductFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  UpdateProductFailure({required this.errMessage, required this.arErrMessage});
}
final class DeleteProductLoading extends AdminState {}
final class DeleteProductSuccessfully extends AdminState {
  //final String message;

  DeleteProductSuccessfully(
   // this.message
    )
    ; 
}
final class DeleteProductFailure extends AdminState {
  final String errMessage;
  final String arErrMessage;

  DeleteProductFailure({required this.errMessage, required this.arErrMessage});
}
