import 'package:flutter/material.dart';

import '../colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton({Key? key,
    required this.title,
    this.loading = false,
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
            gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blue.shade900]),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white)
        ),
        child: Center(child: loading ?
        const CircularProgressIndicator(
          color: Colors.white,
        )
            :
        Text(title, style: TextStyle(color: AppColors.white,fontSize: 20 ),)),
      ),
    );
  }
}
