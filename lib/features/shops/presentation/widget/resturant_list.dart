import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/markets_item_model.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';

class ResturantList extends StatelessWidget {

 ResturantList({super.key,this.marketList,this.searchMarketList});

  List<MarketsItemModel>?marketList;
  List<MarketsItemModel>?searchMarketList;


  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:context.read<MarketsCubit>().searchController.text.isEmpty?marketList?.length:searchMarketList?.length,
              itemBuilder: (context, index) {
                final market = context.read<MarketsCubit>().searchController.text.isEmpty? marketList![index] :searchMarketList![index];
                return resturantItem(context,market);
              },
            );
  }
  Padding resturantItem(BuildContext context,MarketsItemModel? market ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.productScreen,arguments: market?.marketItem.id);
        },
        child: resturantCard(market),
      ),
    );
  }

  Card resturantCard(MarketsItemModel? market) {
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

  Positioned detailsUnderImage(MarketsItemModel ?market) {
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

  Text resturantName(MarketsItemModel ?market) {
    return Text(
      market?.marketItem.name ?? "name",
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

  Image resturantImage(MarketsItemModel ?market) {
    if(market?.base64imgae == null ){
      return Image.asset("assets/images/shop3.jpg",fit: BoxFit.cover,height: 250,width: double.infinity,);
    }
    String ?image = market?.base64imgae;
      Uint8List imageBytes = base64Decode(image!);
      return Image.memory(imageBytes, fit: BoxFit.cover, height: 250,
      width: double.infinity,
    );
    
  }
}