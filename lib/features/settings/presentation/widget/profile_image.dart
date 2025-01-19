import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: image == null
            ? const Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/product_images/shope2.jpg"),
              )
            : Image(
                fit: BoxFit.cover,
                image: _isNetworkImage(image!)
                    ? NetworkImage(image!)
                    : FileImage(File(image!)) as ImageProvider,
              ),
      ),
    );
  }

  // Helper method to determine if the image is a URL
  bool _isNetworkImage(String path) {
    return Uri.tryParse(path)?.hasScheme ?? false;
  }
}
