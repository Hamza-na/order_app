// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant.dart';

class CreateProductModel {
  String arMessage;
  String enMessage ;
  ProductModelOfResturant productModelOfResturant;
  String ?image;

  CreateProductModel({
    required this.arMessage,
    required this.enMessage,
    required this.productModelOfResturant,
    this.image
  });

  factory CreateProductModel.fromJson(Map<String,dynamic>json){
    //  String ?relativePath ;
    //  String ?imageNullable = json[ApiKey.imageOfProduct];


    // if(imageNullable!= null)
    //   { 
    //   relativePath = imageNullable.split('public\\').last.replaceAll('\\', '/');
    //   }
    
    return CreateProductModel(
      arMessage: json[ApiKey.messageAr],
      enMessage: json[ApiKey.message],
      image: json[ApiKey.imageOfProduct],
      //imageNullable== null? imageNullable:"${EndPoints.baserUrlForImage}/$relativePath",
      productModelOfResturant: ProductModelOfResturant.fromJson(json[ApiKey.product]));
  }


}
