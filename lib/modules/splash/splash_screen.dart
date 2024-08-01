import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_1pm/modules/layout/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, LayoutScreen.routeName, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/Images/splash.png");
  }
}
