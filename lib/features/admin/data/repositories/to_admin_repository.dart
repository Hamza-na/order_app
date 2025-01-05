// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/admin/data/datasource/to_admin_remote_data_source.dart';

class ToAdminRepository {
  ToAdminRemoteDataSource toAdminRemoteDataSource;


  ToAdminRepository({
    required this.toAdminRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>toAdmin(int userId)async{
    try{
      final response =await toAdminRemoteDataSource.toAdmin(userId);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  


}
