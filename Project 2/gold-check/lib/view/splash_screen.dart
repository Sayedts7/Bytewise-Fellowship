
import 'package:flutter/material.dart';
import 'package:goldcheck/view/onboard/onboard_start_screen.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key,required this.onboardSkip}) : super(key: key);

  bool onboardSkip;
  @override
  State<SplashScreen> createState() => _SplashScreenState(onboardSkip: onboardSkip);
}


class _SplashScreenState extends State<SplashScreen> {

  _SplashScreenState({required this.onboardSkip});
  bool onboardSkip;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        onboardSkip?

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false):
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context)=>OnboardStartScreen()), (route) => false);

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(body:Container(
      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/images/background_img.png'),fit: BoxFit.cover),
      ),
      child: Center(child:
      Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/images/logo.png',)),
      ),)
        ,),
    ));
  }
}