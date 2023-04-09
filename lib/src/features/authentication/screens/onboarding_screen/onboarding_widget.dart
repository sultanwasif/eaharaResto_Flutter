import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tFormHeight),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.40,
          ),
          Column(
            children: [
              Text(
                model.title,
                // style: Theme.of(context).textTheme.headlineMedium, fontFamily: "MONTSERRAT"
                  // style: const TextStyle ( color: tDarkColor, fontSize: 28.0 )
                style: GoogleFonts.poppins( color: tDarkColor, fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              Text(
                model.subTitle,
                // style: Theme.of(context).textTheme.titleMedium,
                style: GoogleFonts.montserrat( color: tDarkColor, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            // style: Theme.of(context).textTheme.titleLarge,
            style: GoogleFonts.montserrat( color: tDarkColor, fontSize: 20),
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}