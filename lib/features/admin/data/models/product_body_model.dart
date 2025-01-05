import 'package:image_picker/image_picker.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class ProductBodyModel {
  String name;
  XFile ?image;
  String description ;
  int pirce ;
  int availableQuantity;

  ProductBodyModel({required this.name,this.image,required this.availableQuantity,required this.description,required this.pirce});

  Map<String,dynamic>toJson(){
    return {
      ApiKey.name:name,
      ApiKey.image:image,
      ApiKey.description:description,
      ApiKey.price:pirce,
      ApiKey.availableQuantity:availableQuantity,
    };
  }

}