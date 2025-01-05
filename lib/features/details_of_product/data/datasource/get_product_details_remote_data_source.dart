import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/details_of_product/data/models/get_product_details_model.dart';

class GetProductDetailsRemoteDataSource {
  ApiConsumer api;
  
  GetProductDetailsRemoteDataSource({required this.api});

  Future<GetProductDetailsModel>getProducts({required int productParams})async{
    final response =await api.get('${EndPoints.products}/1');
    print(response);
    return GetProductDetailsModel.fromJson(response);
  }
}