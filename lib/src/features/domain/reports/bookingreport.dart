import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:flutterapp/src/features/domain/reports/booking_report.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../container/pop_up.dart';
import 'booking_filters.dart';

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
  List<String> _chipItems = [];
  int selectedIndex = 0;

  @override
  void initState() {
    _chipItems = ["None","Paid", "Not Paid"];
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
      // 'Paid': 'Not Paid',
      //'Paid': 'Paid',
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
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                elevation: 5,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    // gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(25),
                    // borderSide: const BorderSide(color: Colors.black)
                ),
                label: const Text('Filters'), // <-- Text
                icon: const Icon(
                  Icons.filter_alt,
                  size: 24.0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PopUpDialogBox(
                        builder: (context) => const BookingReportFilterOptions()
                    ),
                  );
                },
              ),
              Card(
                semanticContainer: false,
                shadowColor: Colors.transparent,
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                ),
                child: OutlinedButton.icon(
                  onPressed: () async {
                    Navigator.of(context).push(
                      PopUpDialogBox(
                          builder: (context) => const BookingReportFilterOptions()
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    // backgroundColor: Colors.red[50],
                    minimumSize: const Size(25,25),
                    // side: const BorderSide(width: 1, color: Colors.red),
                    // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        right: 15,
                        left: 15
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                  ),
                  label: const Text('Filters',style: TextStyle(fontSize: 16),),
                  icon: const Icon(Icons.filter_alt,size: 25,),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
                itemCount: bookingResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(bookingResult[index].refNo.toString()),
                          Text(bookingResult[index].orderDate.toString()),
                          Text(bookingResult[index].address.toString()),
                        ],
                      ),
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
