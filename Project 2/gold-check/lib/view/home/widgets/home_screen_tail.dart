import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../density_test/gold_density_test_screen.dart';

class HomeScreenTail extends StatelessWidget {
   HomeScreenTail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      SizedBox(height: 10,),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${DateFormat('hh:mm a').format(DateTime.now())}',style: Theme.of(context).textTheme.bodySmall!.
            copyWith(fontSize: 10)),
            Expanded(child: Text('')),
            Text('${DateFormat.yMMMMd().format(DateTime.now())}',style: Theme.of(context).textTheme.bodySmall!.
            copyWith(fontSize: 10)),
          ],),
      ),

      SizedBox(height: 10,),

      SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed: (){

            // ToDo Navigae to densiytest screen
            Navigator.push(context, MaterialPageRoute(builder: (context)=> GoldDensityTestScreen()));
          }, child: Text("Density Test",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 17),)))
    ],);
  }
}
