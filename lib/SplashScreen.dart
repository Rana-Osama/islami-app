import 'package:flutter/material.dart';
import 'package:islami_c9_sat/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';
import 'MyThemeData.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: provider.currentTheme == ThemeMode.dark
          ? Image.asset('assets/images/splash_dark.png',
              height: double.infinity, width: double.infinity)
          : Image.asset('assets/images/splash.png',
              height: double.infinity, width: double.infinity),
    );
  }
}
