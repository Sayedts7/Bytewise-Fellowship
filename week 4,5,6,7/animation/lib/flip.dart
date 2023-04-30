import 'dart:math' as math;
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animation/ufo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animation1.dart';
import 'earth.dart';
import 'hero.dart';

class FlipExample extends StatefulWidget {
  const FlipExample();

  @override
  _FlipExampleState createState() => _FlipExampleState();
}

class _FlipExampleState extends State<FlipExample> with TickerProviderStateMixin {
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
  bool _toggler = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip the coin'),
      ),
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
                  print(animationController2);
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
              title: const Text('Flip example'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox.square(
              dimension: 140,
              child: GestureDetector(
                onTap:  _onFlipCardPressed,
                child: FlipCard(
                  toggler: _toggler,
                  frontCard: Image(
                    image: AssetImage('assets/heads.png'),),
                  backCard: Image(image: AssetImage('assets/tails.png')),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100,),
          AnimatedTextKit(animatedTexts: [
            WavyAnimatedText('Click on the coin to f lip',
                textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
            ),
          ]),
        ],
      ),
    );
  }

  void _onFlipCardPressed() {
    setState(() {
      _toggler = !_toggler;
    });
  }
}



class FlipCard extends StatelessWidget {
  final bool toggler;
  final Widget frontCard;
  final Widget backCard;

  const FlipCard({
    required this.toggler,
    required this.backCard,
    required this.frontCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease.flipped,
        child: toggler
            ? SizedBox(key: const ValueKey('front'), child: frontCard)
            : SizedBox(key: const ValueKey('back'), child: backCard),
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnimation,
      child: widget,
      builder: (context, widget) {
        final isFront = ValueKey(toggler) == widget!.key;
        final rotationY = isFront ? rotateAnimation.value : min(rotateAnimation.value, pi * 0.5);
        return Transform(
          transform: Matrix4.rotationY(rotationY)..setEntry(3, 0, 0),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
