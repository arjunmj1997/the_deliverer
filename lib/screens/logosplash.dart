import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:the_deliverer/screens/homepage.dart';
import 'package:the_deliverer/screens/homepage1.dart';
import 'package:the_deliverer/screens/loginpage.dart';
class LogoSplash extends StatelessWidget {
  const LogoSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:AnimatedSplashScreen(
       splash: Image.asset('assets/images/logo-human.webp',width: 250,height: 250,),
       nextScreen: LoginPage(),
       splashTransition: SplashTransition.rotationTransition,
       //pageTransitionType: PageTransitionType.scale,

     ),
    );
  }
}
