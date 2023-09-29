import 'package:flutter/material.dart';

class MyThemeData {
  static bool isDarkEnabled = true;

  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color darkSecondary = Color(0xFFFACC1D);

  static ThemeData LightTheme = ThemeData(
      textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          bodyMedium: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black),
          titleLarge: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 25, color: Colors.white)),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),

        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
          seedColor: lightPrimary,
          primary: lightPrimary,
          secondary: lightPrimary,
          tertiary: Color(0xffc5b391),
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          background: Colors.white),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 32)),
      dividerColor: lightPrimary,
      cardTheme: CardTheme(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
      bottomSheetTheme:const BottomSheetThemeData(
          backgroundColor: Colors.white
      )
  );

  static ThemeData DarkTheme = ThemeData(
      textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          bodyMedium: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          titleLarge: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 25, color: Colors.black)),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
          seedColor: darkPrimary,
          primary: darkPrimary,
          secondary: darkSecondary,
          tertiary: Color(0xFF141A2A),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          background: darkPrimary),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: darkSecondary,
          unselectedItemColor: Colors.white,
          backgroundColor: darkPrimary,
          selectedIconTheme: IconThemeData(size: 32)),
      dividerColor: darkSecondary,
      cardTheme: CardTheme(
          color: darkPrimary,
          // surfaceTintColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
        bottomSheetTheme:const BottomSheetThemeData(
      backgroundColor: darkPrimary
    )
  );
}
