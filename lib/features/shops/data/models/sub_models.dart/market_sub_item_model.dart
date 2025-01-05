
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/shops/domain/entities/sub_entity.dart/market_sub_item_entity.dart';

class MarketSubItemModel extends MarketSubItemEntity {
  String createdAt;
  String updatedAt;

  MarketSubItemModel(
      {required super.name,
      required super.id,
      required super.location,
      required super.description,
      super.image,
      required this.createdAt,
      required this.updatedAt});

  factory MarketSubItemModel.fromJson(Map<String, dynamic> json) {
    return MarketSubItemModel(
        id:json[ApiKey.id],
        name: json[ApiKey.name],
        location: json[ApiKey.location],
        description: json[ApiKey.description],
        image: json[ApiKey.image],
        createdAt: json[ApiKey.createdAt],
        updatedAt: json[ApiKey.updatedAt]);
  }
}
