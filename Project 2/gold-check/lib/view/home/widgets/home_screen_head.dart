
import 'package:flutter/material.dart';

class HomeScreenHead extends StatelessWidget {
   HomeScreenHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 5,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight:  Radius.circular(50)
            )
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:80,top: 15),
                    child: Container(height: 65,width: 65,decoration: BoxDecoration(
                      image: DecorationImage(image:AssetImage('assets/images/logo.png',)),
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,right: 10),
                  child: TextButton(onPressed: (){}, child: Text('ENG',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      color: Theme.of(context).primaryColorLight
                  ),)),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Text('Welcome to Gold Check',style:Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20,
                color: Theme.of(context).primaryColorLight
            ),),

            Text("Discover the truth about your gold's purity",
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 11,
                  color: Theme.of(context).primaryColorLight
              ),),

          ],),
      ),
    );
  }
}
