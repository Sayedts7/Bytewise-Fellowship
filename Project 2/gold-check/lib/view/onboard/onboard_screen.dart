import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:goldcheck/view/onboard/onboard_page.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import '../home/home_screen.dart';

class OnboardScreen extends StatefulWidget {
   OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  final controller = PageController();
  int _currentIndex=0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 600,
              child: PageView(

                physics: BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (int index){
                     setState(() {
                       _currentIndex = index;
                     });
                     print(index);
                  },

                children: [

                  OnboardPage( image:'assets/images/onboard1.svg',
                      title: 'Few steps solution for testing',
                      body: 'Weigh, measure, calculate density, and compare to known values.'),

                  OnboardPage( image:'assets/images/onboard2.svg',
                      title: 'Current market rates',
                      body: 'Check the current market value of gold and silver easily.'),

                  OnboardPage( image:'assets/images/onboard3.svg',
                      title: 'Purity of gold and silver',
                      body: 'Find out if your gold or silver is pure or has impurities in it'),

                ],),
            ),

            Expanded(
              child: SmoothPageIndicator(controller: controller, count: 3,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                dotColor: Theme.of(context).primaryColor.withOpacity(0.2),
                activeDotColor: Theme.of(context).primaryColor,
              ),
              ),
            ),

            Container(
                alignment: _currentIndex==2?Alignment.center:Alignment.centerRight,
                child: _currentIndex==2?
                    SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(onPressed: ()async{
                          final sharePref=await SharedPreferences.getInstance();

                          sharePref.setBool("onboardSkip", true).then((value){

                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
                          });

                        }, child:Text('Get Started',
                        style: Theme.of(context).textTheme.bodySmall,
                        )))
                    :TextButton(onPressed: (){

                       setState(() {
                         _currentIndex=2;
                       });

                       controller.jumpToPage(2);

                }, child:Text('Skip',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).primaryColor
                ),))),

            _currentIndex==2?Text(' '):SizedBox(height: 50,)

          ],
        ),
      ),
    );

  }
}

