
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:flutterapp/src/features/authentication/screens/login/forget_password.dart';
import 'package:flutterapp/src/features/authentication/screens/sign_up/sign_up.dart';
import 'package:flutterapp/src/features/authentication/screens/welcome_screen/welcomescreen.dart';
import 'package:flutterapp/src/features/domain/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: tPrimaryColor,
          body:
      SingleChildScrollView(child:
      Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/logo/aharalogo.png")),
          const SizedBox(height: tDefaultSize- 10,),
          Text("Restaurant Login", style: Theme.of(context).textTheme.headlineSmall,),
          Text("Get Orders, Approve Orders, Check Payments", style: Theme.of(context).textTheme.bodySmall,),

          Form(
              child:
          Container(
            padding: const EdgeInsets.symmetric(vertical: tDefaultSize -10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    //hintText: "User Name",
                    labelText: "User Name",
                    border: OutlineInputBorder()
                  ),
                  controller: _usernameController,
                ),
                const SizedBox(height: tFormHeight,),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    //hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_red_eye_sharp),
                    )
                  ),
                  controller: _passwordController,
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPassword()));
                    },
                    child: const Text("Forget Password ?"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){ login(); },
                      child: const Text("LOGIN")),
                ),
                const SizedBox(height: tFormHeight,),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: const [
                          TextSpan(
                            text: "Signup",
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)
                          )
                        ]
                      ),

                    ),
                  ),
                ),
              ],

            ),
          ))
        ],
        ),
      ))),
    );
  }

  login() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    Map<String, String> user = {
      'UserName': _usernameController.text,
      'Password' : _passwordController.text
    };
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(user);
    http.Response response = await http
        .post(Uri.parse('${tBasePath}login'),
        headers: headers,
        body: jsonBody);
    var tempTokenInfo = json.decode(response.body);
    if(tempTokenInfo is Map<String, dynamic>){
      Map<String, dynamic> tokenInfo  = json.decode(response.body);
      if (kDebugMode) {
        print('Shop Id : ${tokenInfo['ShopId']} Role : ${tokenInfo['Role']}');
      }
      if (tokenInfo['Role'].toString().toLowerCase() == 'shop') {
        prefs.setString('token', tokenInfo['Token']);
        prefs.setString('shopId', tokenInfo['ShopId'].toString());
        prefs.setString('shopName', tokenInfo['UserName']);
        if (context.mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      } else {
        _showErrorDialog();
      }
    } else {
      _showErrorDialog();
    }

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const WelcomeScreen())
    // );
    // controller.jumpToPage(page: 2);
  }

  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Try Again.'),
                Text('Invalid Credentials'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
