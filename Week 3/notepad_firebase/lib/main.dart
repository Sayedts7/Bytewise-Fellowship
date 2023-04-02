import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notepad_firebase/utils/routes/route.dart';
import 'package:notepad_firebase/utils/routes/route_names.dart';
import 'package:notepad_firebase/view/login_view.dart';
import 'package:notepad_firebase/view/signup_view.dart';
import 'package:notepad_firebase/view/splash_screen.dart';
import 'package:notepad_firebase/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=> Auth_view_model()),
        ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notepad',
      theme:ThemeData(scaffoldBackgroundColor: const Color(0xff6699cc)),
      initialRoute: RouteNames.Splash,
      onGenerateRoute: Routes.generateRoute,
    ));
  }
}

