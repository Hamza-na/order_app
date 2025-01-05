import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order_app/core/constant/colors/colors.dart';


class Upside extends StatelessWidget {
  const Upside({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 2,
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child:SvgPicture.asset(
              imgUrl,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        iconBackButton(context),
      ],
    );
  }
}

iconBackButton(BuildContext context) {
  return IconButton(
    color: Colors.white,
    iconSize: 28,
    icon: const Icon(CupertinoIcons.arrow_left),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}