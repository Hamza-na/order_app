part of 'admin_cubit.dart';


class AdminState {}

final class ToUserInitial extends AdminState {}



final class ToUserLoading extends AdminState {}
final class ToUserSuccessfully extends AdminState {
  final String message;

  ToUserSuccessfully(this.message); 
}
final class ToUserFailure extends AdminState {
  final String errMessage;

  ToUserFailure(this.errMessage);
}

final class ToAdminLoading extends AdminState {}
final class ToAdminSuccessfully extends AdminState {
  final String message;

  ToAdminSuccessfully(this.message); 
}
final class ToAdminFailure extends AdminState {
  final String errMessage;

  ToAdminFailure(this.errMessage);
}


final class AdminResponseSuccessfully extends AdminState {
  final String message;

  AdminResponseSuccessfully(this.message); 
}
final class AdminResponseFailure extends AdminState {
  final String errMessage;

  AdminResponseFailure(this.errMessage);
}

final class CreateMarketLoading extends AdminState {}
final class CreateMarketSuccessfully extends AdminState {
  final String message;

  CreateMarketSuccessfully(this.message); 
}
final class CreateMarketFailure extends AdminState {
  final String errMessage;

  CreateMarketFailure(this.errMessage);
}
final class UpdateMarketLoading extends AdminState {}
final class UpdateMarketSuccessfully extends AdminState {
  final String message;

  UpdateMarketSuccessfully(this.message); 
}
final class UpdateMarketFailure extends AdminState {
  final String errMessage;

  UpdateMarketFailure(this.errMessage);
}
final class DeleteMarketLoading extends AdminState {}
final class DeleteMarketSuccessfully extends AdminState {
  final String message;

  DeleteMarketSuccessfully(this.message); 
}
final class DeleteMarketFailure extends AdminState {
  final String errMessage;

  DeleteMarketFailure(this.errMessage);
}
final class CreateProductLoading extends AdminState {}
final class CreateProductSuccessfully extends AdminState {
  final String message;

  CreateProductSuccessfully(this.message); 
}
final class CreateProductFailure extends AdminState {
  final String errMessage;

  CreateProductFailure(this.errMessage);
}
final class UpdateProductLoading extends AdminState {}
final class UpdateProductSuccessfully extends AdminState {
  final String message;

  UpdateProductSuccessfully(this.message); 
}
final class UpdateProductFailure extends AdminState {
  final String errMessage;

  UpdateProductFailure(this.errMessage);
}
final class DeleteProductLoading extends AdminState {}
final class DeleteProductSuccessfully extends AdminState {
  final String message;

  DeleteProductSuccessfully(this.message); 
}
final class DeleteProductFailure extends AdminState {
  final String errMessage;

  DeleteProductFailure(this.errMessage);
}
