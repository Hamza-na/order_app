import 'package:flutter/material.dart';


class PageTitleBar extends StatelessWidget {
  const PageTitleBar({super.key,required this.title }) ;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 260.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
          color: Color(0xfffeeeee4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              color: Color(0xfff575861)
            ),
          ),
        ),
      ),
    );
  }
}