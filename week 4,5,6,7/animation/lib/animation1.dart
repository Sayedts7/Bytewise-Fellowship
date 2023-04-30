import 'dart:async';
import 'package:animation/ufo.dart';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'earth.dart';
import 'flip.dart';
import 'hero.dart';

class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with TickerProviderStateMixin {
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
 static const _ktext = [
   'Hello', 'Welcome to my App', 'How are you doing'
 ];
  double _opacity = 1.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(

        child: Container(
          height: MediaQuery.of(context).size.height*1,
          child: Stack(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _opacity = 1.0 - _opacity;
                  });
                  Timer(
                      const Duration(
                          seconds: 2
                      ),
                          ()=>   Navigator.push(context, MaterialPageRoute(builder: (context)=> const Earth_slider()))
                  );
                },
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),


                  child: const Center(child: Text('Click me and wait for to vanish!', style: TextStyle(
                      fontSize: 25
                  ),)),
                ),
              ),
              AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts:[
                    for( final txt in _ktext)
                      RotateAnimatedText(
                          txt, textStyle: const TextStyle(
                          fontSize: 40,color: Colors.blueAccent, fontWeight: FontWeight.bold
                      ),
                          textAlign: TextAlign.start
                      )
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}