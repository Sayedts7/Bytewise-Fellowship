import 'package:api_pratice/Screens/Splash.dart';
import 'package:api_pratice/services/states_services.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const Start());
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}

