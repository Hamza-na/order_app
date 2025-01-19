import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/shops/presentation/widget/market_bloc_builder.dart';
import 'package:order_app/generated/l10n.dart';

class ShopsScreen extends StatelessWidget {
  const ShopsScreen({super.key});

  //List<MarketsItemModel>marketList ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shopsAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: appBarDecoration(),
                child: textFieldSearchResturant(context),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: containerDecoration(),
                child: textContainer(context),
              ),
              MarketBlocBuilder(isAdmin: false,)
            ],
          ),
        ),
      ),
    );
  }


  

  BoxDecoration appBarDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        appBarShadow(),
      ],
    );
  }

  Text textContainer(BuildContext context) {
    return Text(
      S.of(context).container_text_home_screen,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.5,
        shadows: [
          Shadow(
            offset: const Offset(2, 2),
            blurRadius: 8,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [primaryColor, secondColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }

  TextField textFieldSearchResturant(BuildContext context) {
    return  TextField(
      controller:context.read<MarketsCubit>().searchController ,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: S.of(context).search_hint_home_screen,
        hintStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
        contentPadding:const  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        
      ),
      onTap:(){
        //_startSearch(context);
      },
      onChanged: (searchedShop){
        context.read<MarketsCubit>().eitherFailureOrSearchMarktes(searchedShop);
      },
    );
  }

  // void _startSearch(BuildContext context) {
  //   ModalRoute.of(context)!
  //       .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _clearSearch(context)));
  // }
  // dynamic _clearSearch(BuildContext context) {
  //     context.read<MarketsCubit>().searchController.clear();
  //   }
   }

  BoxShadow appBarShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 8,
      offset: const Offset(0, 3),
    );
  }

  AppBar shopsAppBar() {
    return AppBar(
      title: const Text(
        'ITE ORDER',
      ),
      backgroundColor: primaryColor,
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          height: 40,
          width: 40,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
            size: 27,
          ),
        ),
      ],
    );
  }
