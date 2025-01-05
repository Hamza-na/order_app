import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order_app/features/on_boarding/presentation/on_boarding_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(12),
        color:model.pageColor,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [
            SvgPicture.asset(model.image,height: size.height * 0.5),
            Column(
              children: [
                Text(model.title,style: Theme.of(context).textTheme.headlineMedium,),
                Text(model.subtitle,textAlign: TextAlign.center,),
              ],
            ),
            Text(model.counterText),
            const SizedBox(height: 50,)
        ],
    ),);
  }
}