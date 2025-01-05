import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: const Image(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/product_images/shope2.jpg")
        ) 
      ),
    );
  }
}