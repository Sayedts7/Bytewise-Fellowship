import 'package:flutter/material.dart';

import '../colors.dart';

class Round_Button extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const Round_Button({Key? key,
    required this.title,
    this.loading = false,
  required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(child: loading ? CircularProgressIndicator() : Text(title, style: TextStyle(color: AppColors.white, ),)),
      ),
    );
  }
}
