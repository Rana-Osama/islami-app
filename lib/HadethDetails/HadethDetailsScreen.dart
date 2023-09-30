import 'package:flutter/material.dart';
import 'package:islami_c9_sat/home/hadeth/Hadeth.dart';
import 'package:provider/provider.dart';

import '../MyThemeData.dart';
import '../providers/SettingsProvider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.getBackgroundImage()),
                fit: BoxFit.fill)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(args.title),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Card(
                    elevation: 18,
                    margin: EdgeInsets.symmetric(vertical: 64, horizontal: 18),
                    child: SingleChildScrollView(
                      child: Text(args.content,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                ),
              ],
            )));
  }
}
