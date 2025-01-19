import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';

class GetProductDetailsRemoteDataSource {
  ApiConsumer api;
  
  GetProductDetailsRemoteDataSource({required this.api});

  Future<ProductModelOfResturantWithImage>getProducts({required int productParams})async{
    final response =await api.get('${EndPoints.products}/$productParams');
    print(response);
    return ProductModelOfResturantWithImage.fromJson(response);
  }
}