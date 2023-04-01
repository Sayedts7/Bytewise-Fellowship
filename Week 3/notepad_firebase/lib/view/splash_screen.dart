import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/routes/route_names.dart';

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
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, RouteNames.Home)  );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notepad App', style: TextStyle(fontSize: 50),),
      ),
    );
  }
}
