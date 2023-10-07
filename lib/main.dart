import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_c9_sat/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami_c9_sat/MyThemeData.dart';
import 'package:islami_c9_sat/chapter_details/ChapterDetails.dart';
import 'package:islami_c9_sat/home/HomeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c9_sat/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import 'SplashScreen.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home:  SplashScreen(),
  ));
  Timer(const Duration(seconds: 2), () async{
    var provider = SettingsProvider();
    await provider.loadTheme();
    await provider.loadLocal();
    runApp(ChangeNotifierProvider(
        create: (buildContext) => provider, child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //search forr settings provider inside widgets tree
    //by default listen for changes in settings provider
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Islami App',
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.DarkTheme,
      //data in settings provider
      themeMode: settingsProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,

//can be written => localizationsDelegates: AppLocalizations.localizationsDelegates,
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
  }
}
