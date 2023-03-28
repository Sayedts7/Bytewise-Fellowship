import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/ruotes/routes_names.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

  switch(settings.name){
    case Route_Name.home:
      return MaterialPageRoute(builder: (context)=> const HomeView());

    case Route_Name.login:
      return MaterialPageRoute(builder: (context)=> const LoginView());

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