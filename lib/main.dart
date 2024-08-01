import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_1pm/core/theme/app_theme.dart';
import 'package:islami_1pm/modules/layout/layout_screen.dart';
import 'package:islami_1pm/modules/splash/splash_screen.dart';
import 'modules/hadeth/hadeth_details_screen.dart';
import 'modules/quran/surah_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()
    ),
  );
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
