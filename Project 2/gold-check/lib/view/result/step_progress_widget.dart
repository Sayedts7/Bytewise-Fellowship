import 'package:flutter/cupertino.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;
import '../../core/apptheme/app_light_color.dart';

class StepProgressWidget extends StatelessWidget {
  final double result;
  final int steps;
   const StepProgressWidget({Key? key, required this.result, required this.steps}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CircularStepProgressIndicator(
      totalSteps: steps,
      currentStep: int.parse(result.toStringAsFixed(0)),

      stepSize: 8,
      arcSize: math.pi * 2,
      selectedColor: primaryColor,
      unselectedColor: thirdColor,
      padding: 0,
      width: 120,
      height: 120,
      fallbackHeight: 200,
      circularDirection: CircularDirection.clockwise,
      startingAngle: 8,
      selectedStepSize: 13,
      roundedCap: (_, __) => true,
      child: Center(child: Text((result.toStringAsFixed(2)).toString(), style: TextStyle(fontSize: 25,

        color: thirdColor,

      ),)),
    );
  }
}
