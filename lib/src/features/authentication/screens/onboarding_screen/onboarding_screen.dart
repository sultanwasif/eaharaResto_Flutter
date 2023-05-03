import 'package:flutter/material.dart';
import 'package:flutterapp/src/features/authentication/screens/welcome_screen/welcomescreen.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/features/container/container.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_model.dart';
import 'onboarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final controller = LiquidController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    //final obController = OnBoardingController();
    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: "assets/onboarding/pablo-965_on2.png",
          title: "ORDER ONLINE",
          subTitle: "Favourite dishes @ your finger tips, use our App & order now",
          counterText: "1/3",
          bgColor: tOnBoardingPage1Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: "assets/onboarding/silky-delivery5.png",
          title: "ON TIME DELIVERY",
          subTitle:
              "Get your order on time and serve your loved ones in no time",
          counterText: "2/3",
          bgColor: tOnBoardingPage2Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: "assets/onboarding/pablo-965_on4.png",
          title: "SERVE HOT FOOD",
          subTitle:
              "Party or Movie Time be Calm and serve hot your on-time delivery order",
          counterText: "3/3",
          bgColor: tOnBoardingPage3Color,
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            enableSideReveal: true,
            liquidController: controller,
            onPageChangeCallback: onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.circularReveal,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => skip(),
              child: const Text("Skip", style: TextStyle(color: Colors.black)),
            ),
          ),
          Positioned(
            bottom: 20,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: controller.currentPage,
              duration: const Duration(milliseconds: 100),
              onDotClicked: (cv) {
                print(cv);
                animateToNextSlide();
              },
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xff272727),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPageChangedCallback(int activePageIndex) async {
    if (activePageIndex == 2) {
      setState(() {
        currentPage = activePageIndex;
      });
      await Future.delayed(const Duration(milliseconds: 500))
          .then((value) => skip());
    } else {
      setState(() {
        currentPage = activePageIndex;
      });
    }
  }

  skip() async {
    final SharedPreferences prefs = await _prefs;
    //final String? shopName = prefs.getString('shopName');
    if (prefs.containsKey('shopName')) {
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavBarContainer()));
      }
    } else {
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      }
    }

    // controller.jumpToPage(page: 2);
  }

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    if (controller.currentPage == 2) {
      skip();
    } else {
      controller.animateToPage(page: nextPage);
    }
  }

  futurePref() async {
    final SharedPreferences prefs = await _prefs;
    //final String? shopName = prefs.getString('shopName');
    if (prefs.containsKey('shopName')) {
      return prefs.getString('shopName').toString();
    } else {
      return "";
    }
  }
}
