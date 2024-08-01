import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_1pm/modules/layout/screens/hadeth_screen.dart';
import 'package:islami_1pm/modules/layout/screens/quran_screen.dart';
import 'package:islami_1pm/modules/layout/screens/radio_screen.dart';
import 'package:islami_1pm/modules/layout/screens/sebha_screen.dart';
import 'package:islami_1pm/modules/layout/screens/settings_screen.dart';

import '../../core/widgets/custom_bg.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  // @override
  // initState(){
  //   super.initState();
  //
  //   print(getList<double>());
  // }
  // List<T> getList<T extends Object>(){
  //   if(T == int){
  //     return List<int>.filled(100, 10) as List<T>;
  //   }else if(T == double){
  //     return List<double>.filled(100, 10) as List<T>;
  //   }else {
  //     return List<String>.filled(100, "10") as List<T>;
  //   }
  // }
  List<String> titles = [
    "islami",
    "hadeth",
    "sebha",
    "radio",
    "settings",
  ];
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingsScreen()
  ];
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return CustomBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            titles[selectedIndex].tr(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            controller.animateToPage(selectedIndex,
                duration: Duration(seconds: 1), curve: Curves.decelerate);

            setState(() {});
          },
          items:  [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/Images/icon_quran.png")),
                label: "quran".tr()),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/Images/icon_hadeth.png")),
                label: "hadeth".tr()),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/Images/icon_sebha.png")),
                label: "sebha".tr()),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/Images/icon_radio.png")),
                label: "radio".tr()),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings".tr()),
          ],
        ),
        body: PageView(
          controller: controller,
          onPageChanged: (value) {
            selectedIndex = value;
            setState(() {});
          },
          children: screens,
        ),
      ),
    );
  }
}
