// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/products_model.dart';

class GetProductsMarketRemoteDataSource {
  ApiConsumer api;

  GetProductsMarketRemoteDataSource({
    required this.api,
  });

  Future<ProductsModel>getProducts({required int params})async{
    final response =await api.get("${EndPoints.markets}/$params");
    print(response);
    return ProductsModel.fromJson(response);
  }
  
}
