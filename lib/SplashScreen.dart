import 'package:flutter/material.dart';
import 'package:islami_c9_sat/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = SettingsProvider();
    return FutureBuilder(
      future: provider.loadTheme(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          String? theme = provider.getTheme();
          return Scaffold(
            body: theme == 'Light'
                ? Image.asset('assets/images/splash.png',
                    height: double.infinity, width: double.infinity)
                : Image.asset('assets/images/splash_dark.png',
                    height: double.infinity, width: double.infinity),
          );
        }
      },
    );
  }
}
