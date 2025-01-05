import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/on_boarding/presentation/on_boarding_model.dart';
import 'package:order_app/features/on_boarding/presentation/on_boarding_page_widget.dart';


final onBoardingPages = [
      OnBoardingPage(
          model: OnBoardingModel(
              image: 'assets/images/on_boarding_images/image1.svg',
              title: 'this is title',
              subtitle: 'this is subtitle',
              counterText: '1/3',
              pageColor: primaryColor,
              )),
      OnBoardingPage(
          model: OnBoardingModel(
              image: 'assets/images/on_boarding_images/image1.svg',
              title: 'this is title',
              subtitle: 'this is subtitle',
              counterText: '2/3',
              pageColor: secondColor,
              )),
      OnBoardingPage(
          model: OnBoardingModel(
              image: 'assets/images/on_boarding_images/image1.svg',
              title: 'this is title',
              subtitle: 'this is subtitle',
              counterText: '3/3',
              pageColor:thirdColor ,
              ))
    ];
    