import 'package:alpha/views/home_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  //This widget is شوف وظيفة السطر ده إيه ؟
  WidgetsFlutterBinding.ensureInitialized();
  //This block of code to prevent screen rotation ********************
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //******************************************************************

  runApp(const Alpha());
}

class Alpha extends StatelessWidget {
  const Alpha({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        pageTransitionType: PageTransitionType.topToBottom,
        animationDuration: const Duration(seconds: 2),
        splashTransition: SplashTransition.fadeTransition,
        splash: const CircleAvatar(
            radius: 300,
            backgroundImage: AssetImage('assets/girl_reading_splash.png')),
        nextScreen: const HomeView(),
        backgroundColor: Colors.purple,
        splashIconSize: 300,
      ),
    );
  }
}
