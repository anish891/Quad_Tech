import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quad_btech/home.dart';
import 'package:quad_btech/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: Icons.home,
        duration: 3000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.blue,
        nextScreen: MyHomePage(title: "quad_btech")),
    );
  }
}



