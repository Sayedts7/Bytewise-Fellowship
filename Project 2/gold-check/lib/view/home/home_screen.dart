import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:goldcheck/model/data_state.dart';
import 'package:goldcheck/view/density_test/gold_density_test_screen.dart';
import 'package:goldcheck/view/home/widgets/custom_toggle_button.dart';
import 'package:goldcheck/view/home/widgets/home_screen_head.dart';
import 'package:goldcheck/view/home/widgets/home_screen_tail.dart';
import 'package:goldcheck/view_model/home_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/chart_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isGold = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:SafeArea(
      child: Column(
        children: [
          HomeScreenHead(),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Consumer<HomeViewModel>(builder: (context,homeVM,_){

              if(homeVM.dataState==DataState.loading){

                return Center(child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),);

              }else if(homeVM.dataState==DataState.error){

               return Center(child:Text('no data available try again later',
                 style:Theme.of(context).textTheme.bodySmall,),);

              }else{ return  Column(
                children: [
                  SizedBox(height: 15,),

                  Row(children: [
                    Container(height: 10,width: 20,decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),),

                    SizedBox(width: 5,),

                    Text('Gold',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(color: Theme.of(context).primaryColorDark),),

                    Text(' (Per Gram)',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(color: Theme.of(context).primaryColorDark,
                        fontSize: 10
                    ),),
                  ],),
                  SizedBox(height: 5,),

                  Row(children: [

                    Text('${homeVM.goldPrinceInPKR}',style: Theme.of(context).textTheme.titleSmall),
                    Text('  PKR',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(fontSize: 10),),
                    Expanded(child: Text(' ')),

                    Container(width:2 ,height: 15,color: Theme.of(context).primaryColorDark.withOpacity(0.3),),
                    SizedBox(width: 13,),
                    Text('${homeVM.goldPrinceInUSD}',style: Theme.of(context).textTheme.titleSmall),
                    Text('  USD',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(fontSize: 10),),
                    Expanded(child: Text(' '))

                  ],),
                  SizedBox(height: 10,),

                  Divider(color:Theme.of(context).primaryColorDark.withOpacity(0.3) ,height: 2,),

                  SizedBox(height: 10,),

                  Row(children: [
                    Container(height: 10,width: 20,decoration: BoxDecoration(
                        color: Color.fromRGBO(69, 90, 100, 1),
                        borderRadius: BorderRadius.circular(10)
                    ),),
                    SizedBox(width: 5,),

                    Text('Silver',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(color: Theme.of(context).primaryColorDark),),

                    Text(' (Per Gram)',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(color: Theme.of(context).primaryColorDark,
                        fontSize: 10
                    ),),

                  ],),

                  Row(children: [

                    Text('${homeVM.silverPrinceInPKR}',style: Theme.of(context).textTheme.titleSmall),
                    Text('  PKR',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(fontSize: 10),),
                    Expanded(child: Text(' ')),

                    Container(width:2 ,height: 15,color: Theme.of(context).primaryColorDark.withOpacity(0.3),),
                    SizedBox(width: 13,),

                    Text('${homeVM.silverPrinceInUSD}',style: Theme.of(context).textTheme.titleSmall),
                    Text('  USD',style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(fontSize: 10),),
                    Expanded(child: Text(' '))
                  ],),

                  SizedBox(height: 10,),


                  Divider(color:Theme.of(context).primaryColorDark.withOpacity(0.3) ,height: 2,),

                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Text('Live Rates',style: Theme.of(context).textTheme.titleSmall),
                      Expanded(child: Text(' ')),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomToggleButton(isLeft: isGold,function: (){
                          setState(() {
                            isGold = !isGold;
                          });
                        },),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    child:  Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: isGold? LineChartWidget(
                        linePoints: homeVM.goldPoints,lineColor: Theme.of(context).primaryColor,
                        bottomAxisDates:homeVM.goldDates,metalType: 'g',
                      ): LineChartWidget(
                          linePoints: homeVM.silverPoints,lineColor: Theme.of(context).primaryColorDark,
                          bottomAxisDates:homeVM.silverDates,
                        metalType:'s',

                      ) ,
                    ) ,
                  ),
                ],
              );}
             },),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: HomeScreenTail(),
          )


        ],
      ),
    ),);
  }
}

