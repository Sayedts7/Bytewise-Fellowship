
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';

import 'onboard_screen.dart';

class OnboardStartScreen extends StatelessWidget {
  const OnboardStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/images/background_img.png'),fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Container(height: 150,width: 150,decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage('assets/images/logo.png',)),
          ),),

            SizedBox(height: 15,),

            Text('Welcome to Gold Check',style:Theme.of(context).textTheme.titleSmall,),
          SizedBox(height: 10,),

            Text('Unlock the secrets of your gold with our easy-to-use app.',
              maxLines: 2,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.bodySmall,),

          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: SizedBox(height:100,width:100,
                child:RippleAnimation(

                  color: Theme.of(context).primaryColor,
                  duration: Duration(seconds: 5),
                  repeat: true,
                  ripplesCount: 2,
                  minRadius: 50,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context)=>OnboardScreen()), (route) => false);
                      } ,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context)=>OnboardScreen()), (route) => false);
                        },
                        child: Icon(Icons.arrow_forward_ios,),
                        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>
                            (RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
                        ),
                      ),
                    ),
                  )
                  ,
                )),
          ),

        ],),
      ),
    )) ;

  }
}
