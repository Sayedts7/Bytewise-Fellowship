import 'package:flutter/material.dart';
import 'package:goldcheck/core/apptheme/app_light_color.dart';

class Round_Button extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  const Round_Button({
    Key? key,
    required this.title,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white)),
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: thirdColor, fontSize: 20),
          ))),
    );
  }
}
