import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../MyThemeData.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  double rotationAngle = 40;
  int index = 0 ;

  @override
  Widget build(BuildContext context) {
    if (tasbeh.isEmpty){
      loadHadethFile();
    }

    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 50),
        child: Image.asset(
            MyThemeData.isDarkEnabled? 'assets/images/head_of_sebha_dark.png':
            'assets/images/head_of_sebha.png',
            )),
              Transform.rotate(
                angle: rotationAngle,
                child: Container(

                  margin: EdgeInsets.symmetric(vertical: 80),
                    child: Image.asset(
                        MyThemeData.isDarkEnabled? 'assets/images/body_of_sebha_dark.png':
                        'assets/images/body_of_sebha.png'
                        )),
              ),

            ],
          ),

          Text( AppLocalizations.of(context)!.no_tasbeh,style:Theme.of(context).textTheme.titleMedium,),
          Container(
            margin: EdgeInsets.all(15),
            child:TextButton(
              style: TextButton.styleFrom(
                  foregroundColor:Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  padding:  EdgeInsets.all(15.0),
                  textStyle:  TextStyle(fontSize: 35),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
              ),
              onPressed: () {
                if (counter == 33){
                  counter = 0 ;
                  if (index == tasbeh.length-1){
                    index = 0 ;
                  }else{
                    index++;
                  }
                  rotationAngle +=40;
                }else
                  counter++;
                rotationAngle +=40;

                setState(() {

                });
              },
              child:  Text('${counter}'),
            ),
          ),



          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).colorScheme.secondary,
            )
            ,
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(tasbeh[index],style: Theme.of(context).textTheme.titleLarge,),
            ),
          ),


    ]
    )
    );
  }

  List<String> tasbeh = [];

  void loadHadethFile() async {
    String fileContent =
    await rootBundle.loadString('assets/files/tasbeh.txt');
    List<String> tasbehList = fileContent.trim().split('\n');
    for (int i = 0; i < tasbehList.length; i++) {
      String singleTasbeh = tasbehList[i];
      tasbeh.add(singleTasbeh);
    }
    setState(() {});
  }

}
