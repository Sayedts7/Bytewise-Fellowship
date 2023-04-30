// import 'dart:math';
//
// import 'package:animation/animation1.dart';
// import 'package:animation/earth.dart';
// import 'package:animation/flip.dart';
// import 'package:animation/hero.dart';
// import 'package:animation/ufo.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen>
//     with TickerProviderStateMixin {
//   late AnimationController animationController1;
//   late AnimationController animationController2;
//
//   @override
//   void initState() {
//     animationController1 = AnimationController(
//       vsync: this,
//       duration: Duration(days: 1),
//     )..repeat();
//     animationController2 =
//         AnimationController(vsync: this, duration: const Duration(milliseconds: 5000))
//           ..repeat();
//     super.initState();
//   }
//   @override
//   void dispose() {
//     animationController2.dispose();
//     animationController1.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: Drawer(
//         backgroundColor: Colors.grey.shade300,
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade400,
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailPage(
//                         imageTag: 'image1',
//                         imageUrl: 'assets/earth.png',
//                       ),
//                     ),
//                   );
//                 },
//                 child: Hero(
//                   tag: 'image1',
//                   child: AnimatedBuilder(
//                     animation: animationController1,
//                     builder: (BuildContext, Widget? child) {
//                       return Transform.rotate(
//                           angle: animationController1.value * math.pi * 50000,
//                           child: Image.asset(
//                             'assets/earth.png',
//                           ));
//                     },
//                   ),
//                 ),
//               ),
//             ),
//
//             ListTile(
//               leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
//                   progress: animationController2),
//               title: const Text('Welcome'),
//               onTap: () {
//                 if(animationController2.isCompleted){
//                   animationController2.reverse();
//                   print(animationController2);
//                 }else{
//                   animationController2.forward();
//                 }
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => MyFadeInWidget())
//                 );
//               },
//             ),
//             ListTile(
//               leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
//                   progress: animationController2),
//               title: const Text('Earth Slider'),
//               onTap: () {
//                 if(animationController2.isCompleted){
//                   animationController2.reverse();
//                 }else{
//                   animationController2.forward();
//                 }
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const Earth_slider()));
//               },
//             ),
//             ListTile(
//               leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
//                   progress: animationController2),
//               title: const Text('UFO'),
//               onTap: () {
//                 if(animationController2.isCompleted){
//                   animationController2.reverse();
//                 }else{
//                   animationController2.forward();
//                 }
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const UFOExample()));
//               },
//             ),
//             ListTile(
//               leading: AnimatedIcon(icon: AnimatedIcons.home_menu  ,
//                   progress: animationController2),
//               title: const Text('Flip Coin'),
//               onTap: () {
//                 if(animationController2.isCompleted){
//                   animationController2.reverse();
//                 }else{
//                   animationController2.forward();
//                 }
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const FlipExample()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
