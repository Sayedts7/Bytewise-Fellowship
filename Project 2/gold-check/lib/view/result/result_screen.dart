import 'package:flutter/material.dart';
import 'package:goldcheck/core/apptheme/app_light_color.dart';
import 'package:goldcheck/view/density_test/gold_density_test_screen.dart';
import 'package:goldcheck/view/home/home_screen.dart';
import 'package:goldcheck/view/result/step_progress_widget.dart';
import 'half_chart_widget.dart';

class ResultScreen extends StatelessWidget {
  final String item, density;
  final double karat, purity, percentage , price;
  const ResultScreen(
      {Key? key,
      required this.item,
      required this.karat,
      required this.purity,
      required this.percentage,
      required this.density,
      required this.price
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Result',
          style: TextStyle(color: Colors.black),
        ),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox(
                height: size.height * 0.048,),

            SizedBox(
                height: 101,
                width: 201,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 195,
                      height: 95,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100))),
                    ),
                  ),
                  HalfChart(
                    karat: karat,
                  ),

                ])),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepProgressWidget(
                    result: karat,
                    steps: 24,
                  ),

                  Container(
                    height: 90,
                    width: 1,
                    decoration: BoxDecoration(
                        color: textBodyGrey,
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(width: 2, color: textBodyGrey))),
                  ),
                  StepProgressWidget(
                    result: (karat / 24) * 100,
                    steps: 100,
                  )

                ],
              ),),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Karat', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15)),
                    Text('Purity', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15))
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                height: size.height * 0.43,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Purity weight = ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          ),
                          Text(
                            '${purity.toStringAsFixed(2)} grams',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Density = ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          ),
                          Text(
                            '$density (g/ml)',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Percentage of $item = ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          ),
                          Flexible(
                            child: Container(
                              width: 100,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                '${percentage.toStringAsFixed(2)}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 15,
                                        color:
                                            Theme.of(context).primaryColorLight),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex:2,
                          child: Text(
                            'Percentage of other metals = ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          ),),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${(100 - percentage).toStringAsFixed(2)}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColorLight),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Price = ',

                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          ),
                          Text(
                            '$price USD',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColorLight),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundButton(
                            title: 'Back',
                            onpress: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery.of(context).size.width * 0.35,
                            color: 0xff333333,
                          ),
                          RoundButton(
                            title: 'New Test',
                            onpress: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> GoldDensityTestScreen()),
                                      (route) => route.isFirst,);
                            },
                            width: MediaQuery.of(context).size.width * 0.55,
                            color: 0xff8F8F8F,
                          ),
                        ],
                      )
                    ],
                  ),
                    
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final double width;
  final int color;

  const RoundButton(
      {Key? key,
      required this.title,
      required this.onpress,
      required this.width,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: textBodyGrey,
              )),
          child: Center(
              child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 20, color: secondaryColor),
          ))),
    );
  }
}
