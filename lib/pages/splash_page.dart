import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:mutuo_mobile_app/pages/home_page.dart';
import 'package:mutuo_mobile_app/styles.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        // splash: Lottie.asset('assets/loading-circles.json'),
        splash: 
          const Column(
            children: [
              Image(
                image:
                  AssetImage("assets/icons/png/AppLogowhite.png"),
              ),
              // Image.asset("assets/math.png"),
              Text('InvestImmo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),)
            ],
          ),
        backgroundColor: Styles.primaryColor,
        nextScreen: const Home(),
      splashIconSize: 500,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}