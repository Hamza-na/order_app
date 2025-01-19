import 'package:flutter/material.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/on_boarding/presentation/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animateCart = false;
  bool animateText = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          animatedPositionImage(size),
          animatedPositionedTitle(size),
        ],
      ),
    );
  }

  AnimatedPositioned animatedPositionedTitle(Size size) {
    return AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          right: animateText ? size.width * 0.35 : -200,
          top: size.height * 0.5,
          child: animatedOpacityTitle(),
        );
  }

  AnimatedOpacity animatedOpacityTitle() {
    return AnimatedOpacity(
          opacity: animateText ? 1 : 0,
          duration: const Duration(milliseconds: 1500),
          child: const Text(
            "ITE ORDER",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        );
  }

  AnimatedPositioned animatedPositionImage(Size size) {
    return AnimatedPositioned(
          duration: const Duration(milliseconds: 3000),
          left: animateCart ? 400 : -200,
          top: size.height * 0.2,
          child: animatedOpacityImage(size),
        );
  }
  AnimatedOpacity animatedOpacityImage(Size size) {
    return AnimatedOpacity(
          opacity: animateCart ? 1 : 0,
          duration: const Duration(milliseconds: 1500),
          child: Image.asset(
            'assets/images/splash_images/cart_image.png',
            height: size.height * 0.5,
          ),
        );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animateCart = true;
    });

    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      animateText = true;
    });
    
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>const OnBoarding(),
      ),
    );
  }
}
