import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:(){
        Navigator.pop(context);
      }
        ,),
      centerTitle: true,
        title: Text('Help',style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 20
        ),),
      ),
      body:SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.only(left:13,right: 35),
          child: Column(children: [
            SizedBox(height: 50,),
            Text('Steps to check the purity of gold or silver you own',
              style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(height:20,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(children: [

                infoText(context,"1. ","Place gold on the testing surface, "
                    "determine their weigh in grams and cm3, and obtain an accurate"
                    " measurement of the gold's density."),

                infoText(context,"2. ","Gold density can be expressed in a variety of "
                    "units including grams per cubic centimeter (g/cm³), ounces per cubic inch (oz/in³)"),

                infoText(context, "3. ", "To avoid inaccurate measurements, make sure to calibrate the app "
                    "before use, ensure the testing surface is clean and flat, use the correct amount of gold"),

                infoText(context, "4. ", "The higher the density measurement, the higher the purity of the gold, "
                    "and by comparing the measured density to a known density value for pure gold, it can determine "
                    "the approximate purity of the gold sample"),

                infoText(context, "5. ", "If the app is not working correctly, try restarting the app or the device, or"
                    " reset button to get accurate result every time.")

              ],),
            )

          ],),
        ),
      ),
    );
  }

  Widget infoText(context,String order,String text)=>Padding(
    padding: const EdgeInsets.only(bottom: 13 ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(order,style:Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15) ),
        Expanded(child: Text(text,style:Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15) ,)),
      ],

    ),
  );
}
