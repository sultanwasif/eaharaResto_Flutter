import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/booking_details_dto.dart';

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
  late List<ShopBookingDetails> resultData = [];
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
    List<dynamic> shoppingData = jsonDecode(response.body);

    for (int index = 0; index < shoppingData.length; index++) {
      resultData.add(ShopBookingDetails.fromJson(shoppingData[index]));
    }
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
        body: _isInit == false
            ? Container(
                padding: const EdgeInsets.all(tDefaultSize - 10),
                child: Column(
                  children: [
                    Text('Order Count : ${resultData.length}'),
                    const SizedBox(
                      height: tDefaultSize - 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: resultData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.fromLTRB(0,0,0,10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${resultData[index].name.toString()} (${resultData[index].mobileNo.toString()})', style: Theme.of(context).textTheme.bodyLarge,),
                                    Text('${resultData[index].refNo.toString()} | ${resultData[index].orderDate.toString()}', style: Theme.of(context).textTheme.bodyMedium,),
                                    Text(resultData[index].address.toString(), style: Theme.of(context).textTheme.bodySmall,),
                                    const Divider(
                                      color: Colors.redAccent, //color of divider
                                      height: 2, //height spacing of divider
                                      thickness: 2, //thickness of divier line
                                      indent: 0, //spacing at the start of divider
                                      endIndent: 0, //spacing at the end of divider
                                    ),
                                    Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        for(var mainItem in resultData[index].bookingDetails )
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(child: Text('${mainItem.quantity.toString()} X ${mainItem.item.name.toString()}')),
                                              Text(mainItem.totalPrice.toString())
                                            ],
                                          )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(child: Text(resultData[index].remarks.toString(), style : const TextStyle(color: Colors.redAccent))),
                                        Text('Total : ${resultData[index].total.toString()}', style : const TextStyle(fontWeight: FontWeight.bold))
                                      ],
                                    )
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //   crossAxisAlignment: CrossAxisAlignment.center,
                                    //   children: const [
                                    //     Text("Item Name"),
                                    //     Text("Price"),
                                    //     Text("Quantity"),
                                    //   ],
                                    // ),
                                    // ListView.builder(
                                    //   shrinkWrap: true,
                                    //   itemCount: resultData[index].bookingDetails.length,
                                    //   itemBuilder: (BuildContext context, int index1) {
                                    //     late List<BookingDetail> subData =
                                    //         resultData[index].bookingDetails;
                                    //     return Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //       crossAxisAlignment: CrossAxisAlignment.center,
                                    //       children: [
                                    //         Text(subData[index1].item.name.toString()),
                                    //         Text(subData[index1].price.toString()),
                                    //         Text(subData[index1].quantity.toString()),
                                    //       ],
                                    //     );
                                    //   },
                                    // )
                            //       Center(
                            //         child: DataTable(
                            //           border: TableBorder.all(
                            // width: 1,
                            // color:tDarkColor,),
                            //             dividerThickness: 1,
                            //             columns: const <DataColumn>[
                            //               DataColumn(
                            //                   label: Text("Name"),
                            //                   tooltip: "To Display name"),
                            //               DataColumn(
                            //                   label: Text("Price"),
                            //                   tooltip: "To Display Price"),
                            //               DataColumn(
                            //                   label: Text("Quantity"),
                            //                   tooltip: "Item Quantity"),
                            //             ],
                            //             rows: resultData[index].bookingDetails
                            //                 .map((bookings) =>
                            //                     DataRow(cells: [
                            //                       DataCell(Text(bookings.item.name.toString())),
                            //                       DataCell(Text(bookings.price.toString())),
                            //                       DataCell(Text(bookings.quantity.toString())),
                            //                       // DataCell(Text("Text1")),
                            //                       // DataCell(Text("Text2")),
                            //                       // DataCell(Text("Text3")),
                            //                     ])
                            //             ).toList()),
                            //       )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
