import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:flutterapp/src/features/domain/reports/booking_report.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool _init = true;
  late List<BookingReport> bookingResult = [];
  // var date = DateTime.now();
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now().subtract((const Duration(days: 30))),
    end: DateTime.now(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReports();
  }

  getReports() async {
    if (mounted) {
      setState(() {
        _init = true;
      });
    }
    final SharedPreferences prefs = await _prefs;
    var shopId = prefs.getString('shopId').toString();
    Map<String, dynamic> user = {
      'FromDate': dateTimeRange.start.toIso8601String(),
      'ToDate': dateTimeRange.end.toIso8601String(),
      'ShopId': shopId,
      'Paid': 'Not Paid',
    };
    String jsonBody = json.encode(user);
    http.Response response = await http.post(
        Uri.parse('${tBasePath}BookingReportsShop'),
        headers: tHeaders,
        body: jsonBody);
    if (kDebugMode) {
      print(jsonDecode(response.body));
    }
    List<dynamic> reportData = jsonDecode(response.body);

    for (int index = 0; index < reportData.length; index++) {
      bookingResult.add(BookingReport.fromJson(reportData[index]));
    }

    if (mounted) {
      setState(() {
        _init = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(tDefaultSize - 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Text("Un Paid Reports"),
              Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("Date Range")))
              // TextButton(
              //     child: Row(children: const [
              //       Text("Filter"),
              //       Icon(Icons.filter_alt_rounded),
              //     ]),
              //     onPressed: () {
              //       showSimpleDialog(context);
              //     })
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: bookingResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(bookingResult[index].refNo.toString()),
                        Text(bookingResult[index].orderDate.toString()),
                        Text(bookingResult[index].address.toString()),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }

  void showSimpleDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => const SimpleDialog(
            title: Text("Select Option"),
            children: <Widget>[
              SimpleDialogOption(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
                child: Text("Option 1"),
              )
            ],
          ));
}
