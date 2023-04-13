import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'orders_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool _isInit = true;
  int _newOrder = 0;
  int _approvedOrder = 0;
  final int _readyOrder = 0;
  int _pickedOrder = 0;
  int _cancelOrder = 0;
  int _deliveredOrder = 0;
  int _totalOrder = 0;

  @override
  void initState() {
    super.initState();
    getShopDetails();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize - 10),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: futurePref(),
                    builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) =>
                        Text(
                      snapshot.hasData ? "Welcome ${snapshot.data}" : "",
                      //+ '- DEV'
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                  color: tPrimaryColor,
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderList(
                                                      titleText: "Total Orders",
                                                      statusId: "0")));
                                    },
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Total Orders',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              _totalOrder.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )
                                          ]),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                  color: tPrimaryColor,
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderList(
                                                    titleText: "New Orders",
                                                    statusId: "6",
                                                  )));
                                    },
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'New Orders',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              _approvedOrder.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )
                                          ]),
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Card(
                                  color: tPrimaryColor,
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderList(
                                                      titleText: "Ready Orders",
                                                      statusId: "2")));
                                    },
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Ready Orders',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              _readyOrder.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )
                                          ]),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                  color: tPrimaryColor,
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderList(
                                                      titleText:
                                                          "Picked Orders",
                                                      statusId: "4")));
                                    },
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Picked Orders',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              _pickedOrder.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )
                                          ]),
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Card(
                                  color: tPrimaryColor,
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderList(
                                                      titleText:
                                                          "Cancel Orders",
                                                      statusId: "1")));
                                    },
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Cancel Orders',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              _cancelOrder.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )
                                          ]),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                  color: tPrimaryColor,
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderList(
                                                      titleText:
                                                          "Delivered Orders",
                                                      statusId: "3")));
                                    },
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Delivered Orders',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              _deliveredOrder.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            )
                                          ]),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> futurePref() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('shopName').toString();
  }



  Future<void> getShopDetails() async {
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
    final SharedPreferences prefs = await _prefs;
    var shopId = prefs.getString('shopId').toString();
    final headers = {'Content-Type': 'application/json'};

    http.Response response = await http.get(
      Uri.parse('${tBasePath}DashBoardCounts$tSlash$shopId'),
      headers: headers,
    );
    var tempTokenInfo = json.decode(response.body);
    if (tempTokenInfo is Map<String, dynamic>) {
      Map<String, dynamic> shopDashboard = json.decode(response.body);
      if (kDebugMode) {
        print(json.decode(response.body));
      }
      _newOrder = shopDashboard['New'];
      _approvedOrder = shopDashboard['Approved'] + _newOrder;
      _pickedOrder = shopDashboard['Packed'];
      _cancelOrder = shopDashboard['Cancelled'];
      _deliveredOrder = shopDashboard['Delivered'];
      _totalOrder = _approvedOrder +
          _readyOrder +
          _pickedOrder +
          _cancelOrder +
          _deliveredOrder;
      // _newOrder = 2;
      // _approvedOrder = 1 + _newOrder ;
      // _pickedOrder =4;
      // _cancelOrder = 3;
      // _deliveredOrder = 5;
      // _totalOrder = _approvedOrder + _readyOrder + _pickedOrder + _cancelOrder + _deliveredOrder  ;
    }
    if (mounted) {
      setState(() {
        _isInit = false;
      });
    }
  }
}
