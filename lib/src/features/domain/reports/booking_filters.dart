import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../container/calander/date_range.dart';
import '../../container/pop_up.dart';

class BookingReportFilterOptions extends StatefulWidget {
  const BookingReportFilterOptions({Key? key}) : super(key: key);

  @override
  State<BookingReportFilterOptions> createState() => _BookingReportFilterOptionsState();
}

class _BookingReportFilterOptionsState extends State<BookingReportFilterOptions> {
  bool sel1  = false;
  bool sel2 = false;
  bool sel3 = false;

  DateTime? startDate;
  DateTime? endDate;

  DateTimeRange? _selectedDateRange;

  // This function will be triggered when the floating button is pressed
  void cal1() async {

    return showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now().subtract((const Duration(days: 365))),
      maximumDate: DateTime.now(),
      // endDate: Date,
      // startDate: DateTime.now().subtract((const Duration(days: 365))),
      backgroundColor: Colors.white,
      primaryColor: Colors.black,
      onApplyClick: (start, end) {
        setState(() {
          endDate = end;
          startDate = start;
        });
      },
      onCancelClick: () {
        setState(() {
          endDate = null;
          startDate = null;
        });
      },
    );
  }

  void cal2() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract((const Duration(days: 365))),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
      saveText: 'Done',
      initialEntryMode: DatePickerEntryMode.input
    );


    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "todo.filterOptions",
        createRectTween: (b, e) {
          return CustomRectTween(begin: b!, end: e!);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Material(
              borderRadius: BorderRadius.circular(16),
              // color: Colors.white, // const Color(0xFF1F2426),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                sel1 = true;
                                sel2 = false;
                                sel3 = false;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue[300],
                              minimumSize: const Size(25,25),
                              side: BorderSide(width: 2, color: sel1 == true ? Colors.green : Colors.white),
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
                            child: Text(
                              'None',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: sel1 == true ? Colors.grey : Colors.white
                              ),
                            )
                        ),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                sel1 = false; sel2 = true;sel3 = false;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue[300],
                              minimumSize: const Size(25,25),
                              side: BorderSide(width: 2, color: sel2 == true ? Colors.green : Colors.white),
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
                            child: Text(
                              'Paid',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: sel2 == true ? Colors.green : Colors.white
                              ),
                            )
                        ),
                        OutlinedButton(
                            onPressed: () {
                              print('clicked 3');
                              setState(() {
                                sel1 = false; sel2 = false;sel3 = true;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue[300],
                              minimumSize: const Size(25,25),
                              side: BorderSide(width: 2, color: sel3 == true ? Colors.green : Colors.white),
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
                            child: Text(
                              'Not Paid',
                              style: TextStyle(
                                  fontSize: 20,
                                color: sel3 == true ? Colors.red : Colors.white
                              ),
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton(onPressed: cal1, child: const Text('Cal1')),
                        ElevatedButton(onPressed: cal2, child: const Text('Cal2')),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black,
                        height: 500,
                        child: DateRangePickerDialog(
                          firstDate: DateTime.now().subtract((const Duration(days: 365))),
                          lastDate: DateTime.now(),
                          currentDate: DateTime.now(),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
