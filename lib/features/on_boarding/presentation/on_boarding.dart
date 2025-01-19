import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/on_boarding/presentation/on_boarding_model.dart';
import 'package:order_app/features/on_boarding/presentation/on_boarding_page_widget.dart';
import 'package:order_app/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Replace with your target screen import

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final liquidController = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final onBoardingPages = [
      OnBoardingPage(
        model: OnBoardingModel(
          image: 'assets/images/on_boarding_images/image2.svg',
          title: S.of(context).on_boarding_title_page_one,
          subtitle: S.of(context).on_boarding_sub_title_page_one,
          counterText: '1/3',
          pageColor: primaryColor,
        ),
      ),
      OnBoardingPage(
        model: OnBoardingModel(
          image: 'assets/images/on_boarding_images/image2.svg',
          title: S.of(context).on_boarding_title_page_two,
          subtitle: S.of(context).on_boarding_sub_title_page_two,
          counterText: '2/3',
          pageColor: secondColor,
        ),
      ),
      OnBoardingPage(
        model: OnBoardingModel(
          image: 'assets/images/on_boarding_images/image4.svg',
          title: S.of(context).on_boarding_title_page_three,
          subtitle: S.of(context).on_boarding_sub_title_page_three,
          counterText: '3/3',
          pageColor: thirdColor,
        ),
      )
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          onBoardingLiquidSwipe(onBoardingPages),
          Positioned(
            bottom: 60.0,
            child: outLinedButton(),
          ),
          skipButton(),
          animatedIndicator(),
        ],
      ),
    );
  }

  Positioned animatedIndicator() {
    return Positioned(
      bottom: 10,
      child: AnimatedSmoothIndicator(
        activeIndex: liquidController.currentPage,
        count: 3,
        effect: const WormEffect(
          activeDotColor: Color(0xff272727),
          dotHeight: 5.0,
        ),
      ),
    );
  }

  Positioned skipButton() {
    return Positioned(
      top: 30,
      right: 20,
      child: TextButton(
        onPressed: () => navigateToNextScreen(),
        child: const Text(
          'Skip',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  OutlinedButton outLinedButton() {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Colors.black26),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: circleInOutLinedButton(),
    );
  }

  void onPressed() {
    if (currentPage == 2) {
      // Navigate to the next screen if on the last page
      navigateToNextScreen();
    } else {
      // Otherwise, go to the next page
      int nextPage = liquidController.currentPage + 1;
      liquidController.animateToPage(page: nextPage);
    }
  }

  void navigateToNextScreen() {
    context.pushNamed(Routes.loginScreen);
  }

  Container circleInOutLinedButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xff272727),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.arrow_forward_ios),
    );
  }

  LiquidSwipe onBoardingLiquidSwipe(List<OnBoardingPage> pages) {
    return LiquidSwipe(
      pages: pages,
      liquidController: liquidController,
      onPageChangeCallback: onPageChangeCallback,
      slideIconWidget: const Icon(Icons.arrow_back_ios),
      enableSideReveal: true,
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
