import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../core/apptheme/app_light_color.dart';

class HalfChartForSilver extends StatelessWidget {
  final double fineness;

  HalfChartForSilver({Key? key, required this.fineness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: CircularPercentIndicator(
        radius: 100,
        lineWidth: 15,
        animation: true,
        arcType: ArcType.HALF,
        percent: (fineness/1000),

        // arcBackgroundColor: Colors.grey.withOpacity(0.3),
        startAngle: 270,
        // arcBackgroundColor: Colors.black,
        // fillColor: Colors.black,
        backgroundColor: Colors.black,

        center: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Text( '${fineness.toStringAsFixed(1)} F', style:TextStyle(

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
