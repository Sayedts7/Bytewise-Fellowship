import 'package:flutter/material.dart';
import 'package:mvvm/utils/ruotes/routes_names.dart';

import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: (){
             // Navigator.pushNamed(context, Route_Name.home);
              Utils.toastMessage(
                'No internet'
              );
            },
            child: const Text('Click')),
      ),
    );
  }
}
