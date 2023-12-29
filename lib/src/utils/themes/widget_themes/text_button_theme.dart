import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/constants/sizes.dart';

class TTextButtonTheme {
  TTextButtonTheme._();
  static final lightTextButtonTheme =  TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
  static final darkTextButtonTheme =  TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: tSecondaryColor,
      backgroundColor: tWhiteColor,
      side: const BorderSide(color: tWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

}