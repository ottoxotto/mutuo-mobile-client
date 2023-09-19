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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image:
                      AssetImage("assets/icons/png/AppLogoback.png"),
                  ),
                  // Image.asset("assets/math.png"),
                  // Text('InvestImmo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Styles.whiteColor),)
                ],
              ),
        backgroundColor: Styles.secondaryColor,
        nextScreen: const Home(),
      splashIconSize: 512,
      duration: 2000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: const Duration(milliseconds: 600),
    );
  }
}