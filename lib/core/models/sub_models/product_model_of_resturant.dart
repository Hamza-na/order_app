import 'package:order_app/core/databases/api/end_points.dart';

class ProductModelOfResturant  {
  int id;
  String createAt;
  String updatedAt;
  int marketId;
  String name;
  int price ;
  int availableQuantity;
  String descrption;
  String ?image;
  

  ProductModelOfResturant(
      {required this.name,
      required this.price,
      required this.descrption,
      required this.id,
      required this.createAt,
      required this.updatedAt,
      required this.marketId,
      required this.availableQuantity,
      this.image
      });

      factory ProductModelOfResturant.fromJson(Map<String,dynamic>json){
        return ProductModelOfResturant(
          name: json[ApiKey.name],
          price: json[ApiKey.price],
          descrption: json[ApiKey.description],
          id: json[ApiKey.id],
          createAt: json[ApiKey.createdAt],
          updatedAt: json[ApiKey.updatedAt],
          marketId: json[ApiKey.marketId],
          availableQuantity: json[ApiKey.availableQuantity]);
      }
}


