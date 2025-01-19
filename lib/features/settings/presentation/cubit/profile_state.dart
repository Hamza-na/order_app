part of 'profile_cubit.dart';


 class ProfileState {}

final class UpdateProfileInitial extends ProfileState {}


final class UpdateProfileLoading extends ProfileState {}
final class UpdateProfileSuccessfully extends ProfileState {
  final UpdateProfileResponseModel updateProfileResponseModel;

  UpdateProfileSuccessfully(this.updateProfileResponseModel); 
}
final class UpdateProfileFailure extends ProfileState {
  final String errMessage;
  final String arErrMessage;

  UpdateProfileFailure({required this.errMessage, required this.arErrMessage});
}
final class MeLoading extends ProfileState {}
final class MeSuccessfully extends ProfileState {
  final UserModel userModel;

  MeSuccessfully(this.userModel); 
}
final class MeFailure extends ProfileState {
  final String errMessage;
  final String arErrMessage;

  MeFailure({required this.errMessage, required this.arErrMessage});
}
