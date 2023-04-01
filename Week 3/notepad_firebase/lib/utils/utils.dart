import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void fieldFoucsChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFoucs){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFoucs);

  }


  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(message, style: TextStyle(color: Colors.white),),
      )
    );
    }

}