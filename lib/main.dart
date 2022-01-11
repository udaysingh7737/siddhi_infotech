import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:siddhi_infotech/Home%20Page/home_page_screen.dart';

import 'landing_page/landing_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Siddhi InfoSoft",
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: AnimatedSplashScreen(
        splash: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/landing image.png",
            height: 450,
            width: 450,
          ),
        ),
        nextScreen: const LandingPageScreen(),

        splashIconSize: 180,
        curve: Curves.bounceInOut,
        centered: true,
        splashTransition: SplashTransition.scaleTransition,
        duration: 500,

      ),
    );
  }
}
