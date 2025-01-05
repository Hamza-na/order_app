import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/admin/data/models/create_product_model.dart';
import 'package:order_app/features/admin/data/models/product_body_model.dart';

class CreateProductRemoteDataSource {
  ApiConsumer api;


  CreateProductRemoteDataSource({
    required this.api,
  });

  Future<CreateProductModel>createProduct({required  ProductBodyModel productBodyModel,required int marketId})async{
    final response = await api.post('${EndPoints.products}/$marketId',data: productBodyModel,isFormData:  true);
    return CreateProductModel.fromJson(response);
  }

}
