import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/market_sub_item_model.dart';
import 'package:order_app/features/shops/domain/entities/sub_entity.dart/market_sub_item_entity.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';

class ResturantList extends StatelessWidget {
  final List<MarketSubItemModel>? marketList;

  ResturantList({super.key, this.marketList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: marketList?.length ?? 0,
      itemBuilder: (context, index) {
        final market = marketList![index];
        return resturantItem(context, market);
      },
    );
  }
  Padding resturantItem(BuildContext context,MarketSubItemModel? market ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.productScreen,arguments: market?.id);
        },
        child: resturantCard(market),
      ),
    );
  }

  Card resturantCard(MarketSubItemModel? market) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.2),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: resturantImage(market),
          ),
          detailsUnderImage(market),
        ],
      ),
    );
  }

  Positioned detailsUnderImage(MarketSubItemModel ?market) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: containerUnderImage(),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            resturantName(market),
            const SizedBox(height: 4),
            //resturantPrice(market),
            const SizedBox(height: 4),
            Row(
              children: [
                resturantIconRating(),
                const SizedBox(width: 4),
                //resturantIconRatingText(market),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Text resturantIconRatingText(MarketsItemModel market) {
  //   return Text(
  //     '${favorite['rating']} (${favorite['reviews']} Ratings)',
  //     style: const TextStyle(
  //       color: Colors.white,
  //       fontSize: 14,
  //     ),
  //   );
  // }

  Icon resturantIconRating() {
    return Icon(
      Icons.star,
      color: Colors.amber.shade400,
      size: 16,
    );
  }

  // Text resturantPrice(MarketsItemModel market) {
  //   return Text(
  //     '${favorite['price']} ${favorite['cuisine']}',
  //     style: const TextStyle(
  //       color: Colors.white70,
  //       fontSize: 14,
  //     ),
  //   );
  // }

  Text resturantName(MarketSubItemModel ?market) {
    return Text(
      market?.name ?? "name",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  BoxDecoration containerUnderImage() {
    return BoxDecoration(
      color: Colors.black.withOpacity(0.6),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    );
  }

  Image resturantImage(MarketSubItemModel ?market) {
    if(market?.image == null ){
      return Image.asset("assets/images/shop3.jpg",fit: BoxFit.cover,height: 250,width: double.infinity,);
    }
      return Image.network
      (
      "${market!.image}", fit: BoxFit.cover, height: 250,
      width: double.infinity,
    );
    
  }
}