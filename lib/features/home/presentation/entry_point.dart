import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/home/presentation/widget/menu_btn.dart';
import 'package:order_app/features/home/presentation/widget/side_menu.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/shops/presentation/screens/shope_screen%20.dart';
import 'package:order_app/generated/l10n.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  //int _selectedIndex = 0;
  bool isSideMenuClosed = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  // final List<Widget> _pages = [
  //   SettingScreen(),
  //   const ShopsScreen(),
  //   const Center(child: Text("Likes Screen")),
  //   const CartScreen(),
    
  // ];

  @override
  void initState() {
    context.read<MarketsCubit>().eitherFailureOrMarktes();
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(context),
      backgroundColor: secondColor,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          animatedSideMenuPositioned(context),
          transformSideMenu(context),
          animatedMenuButtonPositioned(context),
        ],
      ),
    );
  }

  Transform transformSideMenu(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(isRTL
            ? -(animation.value - 30 * animation.value * 3.14 / 180)
            : (animation.value - 30 * animation.value * 3.14 / 180)),
      child: Transform.translate(
        offset: Offset(
            isRTL ? -(animation.value * 265) : (animation.value * 265), 0),
        child: Transform.scale(
          scale: scaleAnimation.value,
          child:  const ClipRRect(
            borderRadius:  BorderRadius.all(Radius.circular(24)),
            child: Padding(
              padding:  EdgeInsets.only(bottom: 80.0),
              child:ShopsScreen()
            ),
          ),
        ),
      ),
    );
  }

  AnimatedPositioned animatedMenuButtonPositioned(BuildContext context) {
    bool isRTL =
        Directionality.of(context) == TextDirection.rtl; // Check for RTL
    return AnimatedPositioned(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 200),
      top: 9,
      left:
          isRTL ? (isSideMenuClosed ? null : 0) : (isSideMenuClosed ? 0 : 220),
      right: isRTL ? (isSideMenuClosed ? 0 : 220) : null,
      child: MenuBtn(
        press: () {
          setState(() {
            if (isSideMenuClosed) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            isSideMenuClosed = !isSideMenuClosed;
          });
        },
        icon: isSideMenuClosed
            ? Icons.menu
            : Icons.close, // Change icon based on menu state
      ),
    );
  }

  // Side menu position and animation
  AnimatedPositioned animatedSideMenuPositioned(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      width: 288,
      left: isSideMenuClosed ? -288 : 0,
      height: MediaQuery.of(context).size.height,
      child: const SideMenu(),
    );
  }

  Transform bottomNavigationBar(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 100 * animation.value),
      child: Container(
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: primaryColor,
            color: Colors.black,
            tabBackgroundColor: secondColor,
            gap: 8,
            activeColor: Colors.black,
            padding: const EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.home,
                text:  S.of(context).home,
                onPressed: () {
                  setState(() {
                    // _selectedIndex = 0;
                  });
                },
              ),
              GButton(
                icon: Icons.favorite_border,
                text:  S.of(context).likes,
                onPressed: () {
                  setState(() {
                    // _selectedIndex = 1;
                    context.pushNamed(Routes.favoriteScreen);
                  });
                },
              ),
              GButton(
                icon: Icons.shopping_cart,
                text:  S.of(context).cart,
                onPressed: () {
                  setState(() {
                    // _selectedIndex = 2;
                    context.pushNamed(Routes.order);
                  });
                },
              ),
              GButton(
                icon: Icons.settings,
                text:  S.of(context).settings,
                onPressed: () {
                  setState(() {
                    // _selectedIndex = 3;
                    context.pushNamed(Routes.settingsScreen);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
