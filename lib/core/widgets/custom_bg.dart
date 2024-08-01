import 'package:flutter/material.dart';

class CustomBg extends StatelessWidget {
  Widget child;
   CustomBg({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Images/default_bg.png"))),
        child: child
    );
  }
}
