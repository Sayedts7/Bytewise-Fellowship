import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notepad_firebase/data/firebase%20services/splashservices.dart';

import '../utils/routes/route_names.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  SplashServices splashServices = SplashServices();

  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Image(
            height: 200,
            width: 200,
            image: AssetImage('assets/logo2.png'),)),
          SizedBox(height: 30),
        Text('Notepad App', style: TextStyle(fontSize: 50),   )
        ]),


    );
  }
}
