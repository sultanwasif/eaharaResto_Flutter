import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderList extends StatefulWidget {
  final String titleText;

  final String statusId;

  const OrderList({Key? key, required this.titleText, required this.statusId})
      : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool _isInit = true;
  late List data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrders();
  }

  Future<void> getOrders() async {
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
    final SharedPreferences prefs = await _prefs;
    final shopID = prefs.getString('shopId').toString();
    http.Response response = await http.get(
      Uri.parse(
          '${tBasePath}GetShopSalesById$tSlash$shopID$tSlash${widget.statusId}'),
      headers: tHeaders,
    );
    data = jsonDecode(response.body);
    // if (kDebugMode) {
    //   print(response.body.length);
    // }
    //      if(tempOrders.) {
    //        // Map<String, dynamic> shopDashboard = json.decode(response.body);
    //        data = json.decode(response.body);
    //        if (kDebugMode) {
    //          print(data);
    //        }
    //      }

    if (mounted) {
      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: tPrimaryColor,
          title: Text(
            widget.titleText,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            children: [
              Text('Order Count : ${data.length}'),
              const SizedBox(
                height: tDefaultSize - 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: [
                            Text(data[index]["RefNo"].toString()),
                            Text(data[index]["Name"].toString()),
                            Text(data[index]["Total"].toString()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [Text("Item Name"),
                                Text("Price"),
                                Text("Quantity"),
                              ],
                            ),

                            ListView.builder(
                              shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index1) {
                                  late List subData = data[index]["BookingDetails"];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [Text(subData[index1]["Item"]["Name"].toString()),
                                  Text(subData[index1]["Price"].toString()),
                                  Text(subData[index1]["Quantity"].toString()),
                                ],
                              ) ;
                            },
                            itemCount: data[index]["BookingDetails"].length,)
                            // ListView(
                            //   children: <Widget>[
                            //     Center(
                            //       child: DataTable(
                            //           columns: const <DataColumn>[
                            //             DataColumn(
                            //                 label: Text("Name"),
                            //                 tooltip: "To Display name"),
                            //             DataColumn(
                            //                 label: Text("Price"),
                            //                 tooltip: "To Display Price"),
                            //             DataColumn(
                            //                 label: Text("Quantity"),
                            //                 tooltip: "Item Quantity"),
                            //           ],
                            //           rows: data[index]["BookingDetails"]
                            //               .map((bookings) =>
                            //                   const <DataRow>[DataRow(cells: [
                            //                     // DataCell(Text(bookings["Item"]["Name"].toString())),
                            //                     // DataCell(Text(bookings["Price"].toString())),
                            //                     // DataCell(Text(bookings["Quantity"].toString())),
                            //                     DataCell(Text("Text1")),
                            //                     DataCell(Text("Text2")),
                            //                     DataCell(Text("Text3")),
                            //                   ])]
                            //           )
                            //               .toList()),
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
