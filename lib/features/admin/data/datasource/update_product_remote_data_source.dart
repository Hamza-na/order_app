// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/admin/data/models/create_product_model.dart';
import 'package:order_app/features/admin/data/models/update_product_body_model.dart';

class UpdateProductRemoteDataSource {
  ApiConsumer api;


  UpdateProductRemoteDataSource({
    required this.api,
  });

  Future<CreateProductModel>updateProduct({required  UpdateProductBodyModel productBodyModel,required int productId})async{
    final response = await api.post('${EndPoints.products}/$productId',data: productBodyModel,isFormData:  true);
    return CreateProductModel.fromJson(response);
  }

}
