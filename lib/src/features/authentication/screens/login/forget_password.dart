
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/features/authentication/screens/login/login.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const Image(image: AssetImage("assets/logo/aharalogo.png")),
                const SizedBox(height: tDefaultSize-10,),
                Text("Forget Password", style: Theme.of(context).textTheme.headlineSmall,),
                Text("Get OTP on your Mobile No.", style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: tDefaultSize-10,),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Phone No.",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone)
                      ),
                    ),
                    const SizedBox(height: tDefaultSize-20,),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "OTP",
                        border: OutlineInputBorder()     ,
                      prefixIcon: Icon(Icons.password_outlined)),
                    ),
                    const SizedBox(height: tDefaultSize -10,),
                    ElevatedButton(onPressed: () {},
                        child: const SizedBox(
                          width: double.maxFinite,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "GET OTP"
                            ),
                          ),
                        )),
                    const SizedBox(height: tDefaultSize -10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          }, child: const Text(
                              "Login Screen?"
                          )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: () {}, child: const Text(
                              "Resend OTP"
                          )),
                        ),
                      ]
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
