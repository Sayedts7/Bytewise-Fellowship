import 'dart:async';



import 'package:flutter/material.dart';

import 'flag_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Flag()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            Center(child: const Image(image: AssetImage('images/logon.png'),)),
            Text('General Knowledge', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)
            ,
         SizedBox(height: 80,),
            Text('Developed by: Taimoor Shah', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, color: Colors.white),)

          ],
        ),
      ),
    );
  }
}
