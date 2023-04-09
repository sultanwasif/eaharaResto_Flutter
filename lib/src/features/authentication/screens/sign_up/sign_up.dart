

import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/features/authentication/screens/login/login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/logo/aharalogo.png")),
              const SizedBox(height: tDefaultSize-10,),
              Text("Get On Board!", style: Theme.of(context).textTheme.headlineSmall,),
              Text("Register your shop to get deliveries", style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: tDefaultSize-10,),
              Form(child:
              Column(
                children: [
                  TextFormField(decoration: const InputDecoration(
                    labelText: "User Name",
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    border: OutlineInputBorder()
                  ),),
                  const SizedBox(height: tDefaultSize-20,),
                  TextFormField( decoration: const InputDecoration(
                    labelText: "E-Mail",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder()
                  ),),
                  const SizedBox(height: tDefaultSize-20,),
                  TextFormField(decoration: const InputDecoration(
                    labelText: "Phone",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder()
                  ),),
                  const SizedBox(height: tDefaultSize-20,),
                  TextFormField(decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.fingerprint_outlined),
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    border: OutlineInputBorder()
                  ),),
                  const SizedBox(height: tDefaultSize,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {}, child:
                    const Text("Sign Up")),
                  ),
                  const SizedBox(height: tDefaultSize,),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: Text.rich(TextSpan(
                      text: "Already have an account ? ",
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: const [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(color: Colors.blue)
                        )
                      ]
                    ),),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
