import 'package:flutter/material.dart';
import 'package:mvvm/utils/ruotes/route.dart';
import 'package:mvvm/utils/ruotes/routes_names.dart';
import 'package:mvvm/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: Route_Name.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

