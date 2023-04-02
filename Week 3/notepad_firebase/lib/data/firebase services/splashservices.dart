import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:notepad_firebase/utils/routes/route_names.dart';

class SplashServices{

  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null){
      Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, RouteNames.Home)  );

    }
    else{
      Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, RouteNames.login));

    }


  }
}