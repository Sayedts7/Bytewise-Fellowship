import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'animation1.dart';
import 'earth.dart';
import 'flip.dart';
import 'hero.dart';
class UFOExample extends StatefulWidget {
  const UFOExample({Key? key}) : super(key: key);

  @override
  State<UFOExample> createState() => _UFOExampleState();
}

class _UFOExampleState extends State<UFOExample>with TickerProviderStateMixin {
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
    _animation = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,)..repeat();
    super.initState();
  }  late AnimationController _animation;


  @override
  void dispose() {
    super.dispose();

    _animation.dispose();
  }
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
      body: Container(
        color: Colors.black,
        child: Stack(
            alignment: AlignmentDirectional.center,
            children:[
            const Image(
              height: 1000,
                fit:BoxFit.fitHeight,
        image: AssetImage('assets/stars.jpg')),

           AnimatedBuilder(
                animation: _animation,
                builder: (_, __){
                  return ClipPath(
                    clipper: const BeamClipper(),
                    child: Container(
                      height: 2000,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            radius: 1.5,
                            colors: [Colors.yellow, Colors.transparent],
                          stops: [0, _animation.value],
                        ),

                      ),
                    ),
                  );
                },
              ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Image(image: AssetImage('assets/ufo.png')),
              // SizedBox(
              //   height: 10,
              // ),
              InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> FlipExample()));},
                  child: const Text('Click Here', style: TextStyle(
                    fontSize: 30
                  ),)),
              const SizedBox(
                height: 40,
              ),
            ],
          )
            ]
          ),
        ),
    );

  }
}
class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}