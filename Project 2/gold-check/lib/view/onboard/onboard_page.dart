import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardPage extends StatelessWidget {

   OnboardPage({Key? key,
     required this.image,
     required this.title,
     required this.body}) : super(key: key);

  String image,title,body;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SvgPicture.asset(image),
          ),

          SizedBox(height: 30,),
          Text(title,
            style: Theme.of(context).textTheme.titleSmall,
          ),

          SizedBox(height: 15,),
          Text(body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),

        ],
      ),
    );
  }
}
