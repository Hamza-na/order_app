import 'package:flutter/material.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key, required this.press,required this.icon});


  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: GestureDetector(
              onTap: press,
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 3),
                      blurRadius: 8
                    )
                  ]
                ),
                child:Icon(icon,color: Colors.black,),
                        ),
            ),);
  }
}