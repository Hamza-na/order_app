import 'package:flutter/material.dart';
import 'package:order_app/core/constant/colors/colors.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: primaryColor
                ),
              )
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Image.asset(bottomImage, width: 120),
            // ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}