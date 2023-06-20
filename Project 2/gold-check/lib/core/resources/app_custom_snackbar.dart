import 'package:flutter/material.dart';

showAppSnackBar(BuildContext context,String content){


  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:Text(content) ));

}