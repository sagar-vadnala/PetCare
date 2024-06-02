import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dog_assignment/Onboarding_Screens/onnoarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                "assets/splash_screen.json"
                ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
      nextScreen: OnBoardingScreen(),
      backgroundColor: Color(0xFFF5F5F5),
      splashIconSize: MediaQuery.of(context).size.height / 2,
      duration: 3000,
      );
  }
}