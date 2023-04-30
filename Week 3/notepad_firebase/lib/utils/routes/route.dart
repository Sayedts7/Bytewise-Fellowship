import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_firebase/utils/routes/route_names.dart';
import 'package:notepad_firebase/view/home_view.dart';
import 'package:notepad_firebase/view/login_view.dart';
import 'package:notepad_firebase/view/signup_view.dart';
import 'package:notepad_firebase/view/splash_screen.dart';


class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

  switch(settings.name){
    case RouteNames.login:
      return MaterialPageRoute(builder: (context)=> const Login_view());

    case RouteNames.SignUp:
      return MaterialPageRoute(builder: (context)=> const SignUpView());

    case RouteNames.Home:
      return MaterialPageRoute(builder: (context)=> const HomeView());

    case RouteNames.Splash:
      return MaterialPageRoute(builder: (context)=> const Splash_Screen());



    default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No Route Assigned'),
            ),
          );
        });
  }
  }
}