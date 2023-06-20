import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/apptheme/app_light_color.dart';
import '../../../model/rate_point_model.dart';

class LineChartWidget extends StatelessWidget {

  LineChartWidget({

    required this.linePoints,
    required this.bottomAxisDates,
    required this.lineColor,
    required this.metalType,
    Key? key}) : super(key: key);

  List<RatePointModel> linePoints=[];
  List<String> bottomAxisDates=[];
  Color lineColor=primaryColor;
  int yAxisIndex = 0 ;
  String metalType='g';


  @override
  Widget build(BuildContext context) {
    return Container(width:double.infinity,
      child:LineChart(

          LineChartData(
            maxY: maxY(),
              minY: minY(),
              borderData: FlBorderData(border: Border(right: BorderSide.none,top: BorderSide.none,
                bottom:BorderSide(color: Colors.black),left:BorderSide(color: Colors.black))),
          titlesData: FlTitlesData(

            bottomTitles:AxisTitles(sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget:_getTitleWidget
            )),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
                spots:linePoints.map((RatePointModel e) => FlSpot(e.pointX,e.pointY)).toList(),
                color:lineColor
            ),
          ]
      )) ,);
  }


  Widget _getTitleWidget(double value,TitleMeta meta){


    if(bottomAxisDates.isNotEmpty && bottomAxisDates.length == 7){
    String text = '';
    switch (value.toInt()) {
      case 0:
        text = _getDate(bottomAxisDates[0]);
        break;
      case 5:
        text = _getDate(bottomAxisDates[1]);
        break;
      case 10:
        text = _getDate(bottomAxisDates[2]);
        break;
      case 15:
        text = _getDate(bottomAxisDates[3]);
        break;
      case 20:
        text = _getDate(bottomAxisDates[4]);
        break;
      case 25:
        text = _getDate(bottomAxisDates[5]);
        break;
      case 30:
        text = _getDate(bottomAxisDates[6]);
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(text),
    );

    }
    return  Text('$value');

  }

  String _getDate(String date){
    DateTime dateTime=DateTime.parse(date);
    return "${dateTime.month}-${dateTime.day}";
  }

 double maxY(){
   double max=linePoints[0].pointY;

   linePoints.forEach((element) {

     if(element.pointY>max){
       max=element.pointY;
     }

   });

   if( metalType=='s'){
     return double.parse(max.toStringAsFixed(3));
   }

   return double.parse(max.toStringAsFixed(1));
  }

  double minY(){
    double min=linePoints[0].pointY;

    linePoints.forEach((element) {

      if(element.pointY<min){
        min=element.pointY;
      }

    });

    if( metalType=='s'){
      return double.parse(min.toStringAsFixed(3));
    }

    return double.parse(min.toStringAsFixed(1));
  }


}
