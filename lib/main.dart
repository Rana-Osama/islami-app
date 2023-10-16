import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'SplashScreen.dart';
import 'MyThemeData.dart';
import 'chapter_details/ChapterDetails.dart';
import 'HadethDetails/HadethDetailsScreen.dart';
import 'home/HomeScreen.dart';
import 'providers/SettingsProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: SplashScreen(),
    ),
  );
  Timer(const Duration(seconds: 2), () async {
    var provider = SettingsProvider();
    await provider.loadTheme();
    await provider.loadLocal();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>(
            create: (_) => provider,
          ),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) {
        return MaterialApp(
          title: 'Islami App',
          theme: MyThemeData.LightTheme,
          darkTheme: MyThemeData.DarkTheme,
          //data in settings provider
          themeMode: settingsProvider.currentTheme,
          routes: {
            SplashScreen.routeName: (_) => SplashScreen(),
            HomeScreen.routeName: (_) => HomeScreen(),
            ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
            HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),

          },
          initialRoute: HomeScreen.routeName,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          locale: Locale(settingsProvider.currentLocale),
        );
      },
    );
  }
}