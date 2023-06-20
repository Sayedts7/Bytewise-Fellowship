import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../core/apptheme/app_light_color.dart';

class HalfChart extends StatelessWidget {
  final double karat;
   HalfChart({Key? key, required this.karat}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: CircularPercentIndicator(
        radius: 100,
        lineWidth: 15,
        animation: true,
        arcType: ArcType.HALF,
        percent: (karat/24),

        // arcBackgroundColor: Colors.grey.withOpacity(0.3),
        startAngle: 270,
        // arcBackgroundColor: Colors.black,
        // fillColor: Colors.black,
        backgroundColor: Colors.black,

        center: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Text( '${karat.toStringAsFixed(1)} K', style: TextStyle(

              fontSize: 30,
              color: secondaryColor,
              fontWeight: FontWeight.bold
          ),),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: primaryColor,



      ),
    );
  }
}
