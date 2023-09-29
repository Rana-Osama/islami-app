import 'package:flutter/material.dart';
import 'MyThemeData.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyThemeData.isDarkEnabled == true
          ? Image.asset('assets/images/splash_dark.png',
          height: double.infinity, width: double.infinity)
          : Image.asset('assets/images/splash.png',
          height: double.infinity, width: double.infinity),
    );
  }
}