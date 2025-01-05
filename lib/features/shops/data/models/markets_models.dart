import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/markets_item_model.dart';

class MarketsModels {
  List<MarketsItemModel>marketsItem;

  MarketsModels({required this.marketsItem});

  factory MarketsModels.fromJson(Map<String, dynamic> json) {
    List<MarketsItemModel> markets = [] ;
    markets = List<MarketsItemModel>.from(
        json[ApiKey.markets].map((market) => MarketsItemModel.fromJson(market)),
      );
    return MarketsModels(marketsItem: markets);
  }
}