import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSelectedItem(AppLocalizations.of(context)!.light_theme),
          getUnselectedItem(AppLocalizations.of(context)!.dark_theme)
        ],
      ),
    );
  }

  Widget getSelectedItem(String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.secondary)
        ),
        Icon(Icons.check,color: Theme.of(context).colorScheme.secondary,)
      ],
    );
  }

  Widget getUnselectedItem(String text){
    return  Text(text,style: Theme.of(context).textTheme.titleMedium);
  }
}
