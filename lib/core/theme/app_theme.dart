import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static const Color primaryLightColor = Color(0xffB7935F);
  static const Color primaryDarkColor = Color(0xff141A2E);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily : GoogleFonts.elMessiri().fontFamily,
    appBarTheme:  AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30,
          color: const Color(0xff242424)
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor:primaryLightColor ,
      selectedItemColor: Color(0xff242424),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
    dividerTheme: const DividerThemeData(
      color: primaryLightColor,
      thickness: 3
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,color: Colors.black,
      ),bodyMedium: TextStyle(
        fontSize: 16,color: Colors.black,
      ),bodyLarge: TextStyle(
        fontSize: 20,color: Colors.black,
      ),
    )
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      fontFamily : GoogleFonts.elMessiri().fontFamily,

      appBarTheme:  AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
          iconTheme: const IconThemeData(
              color: Colors.white
          ),
        titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        color: const Color(0xff242424)
    )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor:primaryDarkColor ,
      selectedItemColor: Color(0xffFACC1D),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
      dividerTheme: const DividerThemeData(
          color: primaryDarkColor,
          thickness: 3
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 14,color: Colors.white,
        ),bodyMedium: TextStyle(
        fontSize: 16,color: Colors.white,
      ),bodyLarge: TextStyle(
        fontSize: 20,color: Colors.white,
      ),
      )

  );
}