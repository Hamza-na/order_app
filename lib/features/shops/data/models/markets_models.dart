import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/market_sub_item_model.dart';

class MarketsModels {
  List<MarketSubItemModel>marketsItem;

  MarketsModels({required this.marketsItem});

  factory MarketsModels.fromJson(Map<String, dynamic> json) {
    List<MarketSubItemModel> markets = [] ;
    markets = List<MarketSubItemModel>.from(
        json[ApiKey.markets].map((market) => MarketSubItemModel.fromJson(market[ApiKey.market])),
      );
    return MarketsModels(marketsItem: markets);
  }
}