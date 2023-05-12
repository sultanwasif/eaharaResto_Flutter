import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:flutterapp/src/features/domain/reports/booking_report.dart';
import 'package:intl/intl.dart';
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
  DateFormat formatter = DateFormat('yyyy-MM-dd'); //specifies day/month/year format
  late bool _init = true;
  late List<BookingReport> bookingResult = [];
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now().subtract((const Duration(days: 30))),
    end: DateTime.now(),
  );
  List<String> _chipItems = [];
  int selectedIndex = 0;

  @override
  void initState() {
    _chipItems = ["None", "Paid", "Not Paid"];
    // TODO: implement initState
    super.initState();
    getReports(
      dateTimeRange.start.toIso8601String(),
      dateTimeRange.end.toIso8601String(),
      'Both'
    );
  }

  getReports(String fromDate, String toDate, String paidFilter) async {
    bookingResult = [];
    if (mounted) {
      setState(() {
        _init = true;
      });
    }
    final SharedPreferences prefs = await _prefs;
    var shopId = prefs.getString('shopId').toString();
    Map<String, dynamic> user = {
      'FromDate': fromDate,
      'ToDate': toDate,
      'ShopId': shopId,
      'Paid': paidFilter
    };
    String jsonBody = json.encode(user);
    http.Response response = await http.post(
        Uri.parse('${tBasePath}BookingReportsShop'),
        headers: tHeaders,
        body: jsonBody);
    // if (kDebugMode) {
    //   print(jsonDecode(response.body));
    // }
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
            const SizedBox(
              height: 15,
            ),
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
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton.extended(
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
          filterPopUp();
        },
      ),
    );
  }

  Future<void> filterPopUp() async {

   try {
     DateTime startDate = dateTimeRange.start;
     DateTime toDate = dateTimeRange.end;
     String filter = 'Both';
     List result = await Navigator.of(context).push(
       PopUpDialogBox(
         builder: (context) =>
             BookingReportFilterOptions(dateRange: dateTimeRange),
       ),
     );
     if (result.isNotEmpty) {
       if (formatter.format(dateTimeRange.start) != result[0] ||
           formatter.format(dateTimeRange.end) != result[1]) {

         startDate = DateTime.parse(result[0]);
         toDate = DateTime.parse(result[1]);
       }
       if(result[2] == true){
         filter = 'Both';
       }
       if(result[3] == true){
         filter = 'Paid';
       }
       if(result[4] == true){
         filter = 'Not Paid';
       }
       await getReports(
           startDate.toIso8601String(),
           toDate.toIso8601String(),
           filter
       );
     }
   } catch(e) {
     await getReports(
         dateTimeRange.start.toIso8601String(),
         dateTimeRange.end.toIso8601String(),
         'Both'
     );
     log("failed in applying the filter");
   }
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
