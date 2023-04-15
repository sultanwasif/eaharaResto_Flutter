
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/src/features/domain/home/home_screen.dart';
import 'package:flutterapp/src/features/domain/products/products.dart';
import 'package:flutterapp/src/features/domain/reports/reports.dart';
import 'package:flutterapp/src/features/domain/task/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/color.dart';
import '../authentication/screens/spashscreen/splashscreen.dart';

class NavBarContainer extends StatefulWidget {
  const NavBarContainer({Key? key}) : super(key: key);

  @override
  State<NavBarContainer> createState() => _NavBarContainerState();
}

class _NavBarContainerState extends State<NavBarContainer> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      const HomeScreen(),
      const ProductScreen(),
      const ReportScreen(),
      const TaskScreen()
    ];
    final items = <Widget>[
      const Icon(Icons.home, size: 30,),
      const Icon(Icons.food_bank, size: 30,),
      const Icon(Icons.bar_chart, size: 30,),
      const Icon(Icons.update, size: 30,),
    ];
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: tPrimaryColor,
          title: Text(
            "eAhara Restaurant",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          leading: const Icon(
            Icons.restaurant_menu_rounded,
            color: tDarkColor,
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: tPrimaryColor, // Navigation bar
          statusBarColor: tPrimaryColor, // Status bar
        ),),
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        backgroundColor: Colors.transparent,
        color: tPrimaryColor,
        height: 45,
        index: index,
        onTap: (index) => setState(() {
          this.index = index;
        }) ,
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('shopName');
    if (context.mounted) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    }
  }
}
