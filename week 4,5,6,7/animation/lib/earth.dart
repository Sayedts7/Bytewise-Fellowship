import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animation/ufo.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'animation1.dart';
import 'flip.dart';
import 'hero.dart';

class Earth_slider extends StatefulWidget {
  const Earth_slider({Key? key}) : super(key: key);

  @override
  State<Earth_slider> createState() => _Earth_sliderState();
}

class _Earth_sliderState extends State<Earth_slider>  with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;

  @override
  void initState() {
    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(days: 1),
    )..repeat();
    animationController2 =
    AnimationController(vsync: this, duration: const Duration(milliseconds: 5000))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController2.dispose();
    animationController1.dispose();

    super.dispose();
  }
  late double _sliderValue = 0;
  late double finalvalue = 1000;

  late bool boolangle = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          height: double.infinity,
          child: const Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/e_bg.jpg')),
        ),
        Scaffold(
backgroundColor: Colors.transparent,
          appBar: AppBar(),
          drawer: Drawer(
            backgroundColor: Colors.grey.shade300,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            imageTag: 'image1',
                            imageUrl: 'assets/earth.png',
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'image1',
                      child: AnimatedBuilder(
                        animation: animationController1,
                        builder: (BuildContext, Widget? child) {
                          return Transform.rotate(
                              angle: animationController1.value * math.pi * 50000,
                              child: Image.asset(
                                'assets/earth.png',
                              ));
                        },
                      ),
                    ),
                  ),
                ),

                ListTile(
                  leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
                      progress: animationController2),
                  title: const Text('Welcome'),
                  onTap: () {
                    if(animationController2.isCompleted){
                      animationController2.reverse();
                    }else{
                      animationController2.forward();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Animation1())
                    );
                  },
                ),
                ListTile(
                  leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
                      progress: animationController2),
                  title: const Text('Earth Slider'),
                  onTap: () {
                    if(animationController2.isCompleted){
                      animationController2.reverse();
                    }else{
                      animationController2.forward();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Earth_slider()));
                  },
                ),
                ListTile(
                  leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
                      progress: animationController2),
                  title: const Text('UFO'),
                  onTap: () {
                    if(animationController2.isCompleted){
                      animationController2.reverse();
                    }else{
                      animationController2.forward();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UFOExample()));
                  },
                ),
                ListTile(
                  leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
                      progress: animationController2),
                  title: const Text('Flip Coin'),
                  onTap: () {
                    if(animationController2.isCompleted){
                      animationController2.reverse();
                    }else{
                      animationController2.forward();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FlipExample()));
                  },
                ),
              ],
            ),
          ),
          body:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TweenAnimationBuilder(
                  duration: const Duration(seconds: 100),
                  tween: Tween<double>(begin: 0.1, end: _sliderValue*1000),
                  builder:(_, double angle, __){
                    return InkWell(
                      onTap: (){
                        if(boolangle ==true){
                          setState(() {
                            boolangle = false;
                          });
                        }else{
                          setState(() {
                            boolangle = true;
                          });
                        }
                      },
                      child: Transform.rotate(angle: boolangle? angle :angle *(-1),
                          child:
                          const Image(image: AssetImage('assets/earth.png'),)),
                    );
                  },
                ),
              ),
              Slider.adaptive(
                  min: 0,
                  max: 1,
                  value: _sliderValue,
                  onChanged: (double finalvalue){
                    setState(() {

                      _sliderValue= finalvalue;
                    });
                  }),

              InkWell(
                  onTap: ()=>    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> UFOExample())),

                  child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextLiquidFill(
                        waveColor: Colors.blueAccent,
                        textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                        text: "Move the slider or Click on earth and click me for next page",),
                    ),
                  ))
            ],
          ),
        ),

      ],
    );
  }
}
