import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/features/authentication/screens/login/login.dart';
import 'package:flutterapp/src/features/authentication/screens/sign_up/sign_up.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    final size = media.size;
    var brightness = media.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return  Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage("assets/logo/pablo-965_on3.png"), height: size.height * 0.6,),
            Column(
              children: [
                Text("Welcome To eAhara", style: Theme.of(context).textTheme.headlineSmall),
                Text("Please login/Register to order food", style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen())
                  );
                },
                    child : const Text("LOGIN"),)),
                const SizedBox( width: 10.0,),
                Expanded(child: ElevatedButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen())
                  );
                },
                    child: const Text("SIGN UP")))
              ],
            )
          ],
        )
      ),
    );
  }
}