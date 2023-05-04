

import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../container/container.dart';
import '../welcome_screen/welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool animate = false;


  @override
  void initState() {
    super.initState();
    initializeStartUp();

  }

  Future<void> initializeStartUp() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.containsKey('shopName')) {
      if (context.mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NavBarContainer()
           )
        );
      }
    } else {
      startAnimation();
    }

  }
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() { animate = true; });
    await Future.delayed(const Duration(milliseconds: 5000));
    // Get.to(const WelcomeScreen());
    // if (!context.mounted) return;

    if (context.mounted) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen())
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 0 : -30,
            left: animate ? 0 : -30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: const Image(image: AssetImage("assets/logo/taxi-abstract-background-26.png")),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            top: 80,
            left: animate ? tDefaultSize : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eahara",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    "Food Delivery App",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 100 : 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: const Image(image: AssetImage("assets/logo/delivery-boy-on-scooter.png")),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 60 : 0,
            right: tDefaultSize,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Container(
                width: tDefaultSize,
                height: tDefaultSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}