import 'package:flutter/material.dart';
import 'package:islami_1pm/core/theme/app_theme.dart';
import 'package:islami_1pm/modules/layout/layout_screen.dart';
import 'package:islami_1pm/modules/splash/splash_screen.dart';

import 'modules/hadeth/hadeth_details_screen.dart';
import 'modules/quran/surah_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        LayoutScreen.routeName: (context) => LayoutScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        SurahDetails.routeName: (context) =>  SurahDetails(),
        HadethDetailsScreen.routeName: (context) =>  HadethDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
