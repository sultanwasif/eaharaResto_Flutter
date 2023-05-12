import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../container/calander/date_range.dart';
import '../../container/pop_up.dart';

class BookingReportFilterOptions extends StatefulWidget {
  const BookingReportFilterOptions({Key? key, required this.dateRange}) : super(key: key);
  final DateTimeRange dateRange;

  @override
  State<BookingReportFilterOptions> createState() => _BookingReportFilterOptionsState();
}

class _BookingReportFilterOptionsState extends State<BookingReportFilterOptions> {
  bool sel1  = false;
  bool sel2 = false;
  bool sel3 = false;

  final TextEditingController _fromDate = TextEditingController();
  final TextEditingController _toDate = TextEditingController();
  DateFormat formatter = DateFormat('yyyy-MM-dd');//specifies day/month/year format

  DateTimeRange? _selectedDateRange;

  @override
  void initState() {
    _fromDate.value = TextEditingValue(text: formatter.format(widget.dateRange.start));
    _toDate.value = TextEditingValue(text: formatter.format(widget.dateRange.end));
    super.initState();
  }

  // This function will be triggered when the floating button is pressed

  void handleFilters() {
    List result = [_fromDate.text,_toDate.text, sel1, sel2, sel3];
    Navigator.pop(context, result);
  }


  Widget chip(String label, Color color,bool sel) {
    return Chip(
      labelPadding: const EdgeInsets.all(5.0),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: sel == true ? Colors.blue : color,
      elevation: 10.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8),
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        List result = [_fromDate.text,_toDate.text, sel1, sel2, sel3];
        Navigator.pop(context, result);
        return false;
      },
      child: Center(
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
                      const SizedBox(height: 20),
                      const Text(
                        'Please enter the date range',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  controller: _fromDate, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    // contentPadding: const EdgeInsets.all(0),
                                      suffixIcon: GestureDetector(
                                          onTap: () async {
                                            DateTime? pickedDate = await showDatePicker(
                                                context: context,
                                                initialDate: widget.dateRange.start,
                                                currentDate: widget.dateRange.start,
                                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2101)
                                            );
                                            if(pickedDate != null ){
                                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate = formatter.format(pickedDate);
                                              print(formattedDate);
                                              setState(() {
                                                _fromDate.text = formattedDate; //set output date to TextField value.
                                              });
                                            }else{
                                              print("Date is not selected");
                                            }
                                          },
                                          child: const Icon(Icons.calendar_today)
                                      ),
                                      label: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("From Date"),
                                      ) //label text of field
                                  ),

                                )
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  controller: _toDate, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    // contentPadding: const EdgeInsets.all(0),
                                      suffixIcon: GestureDetector(
                                          onTap: () async {
                                            DateTime? pickedDate = await showDatePicker(
                                                context: context,
                                                initialDate: widget.dateRange.end,
                                                currentDate: widget.dateRange.end,
                                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2101)
                                            );
                                            if(pickedDate != null ){
                                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate = formatter.format(pickedDate);
                                              print(formattedDate);
                                              setState(() {
                                                _toDate.text = formattedDate; //set output date to TextField value.
                                              });
                                            }else{
                                              print("Date is not selected");
                                            }
                                          },
                                          child: const Icon(Icons.calendar_today)
                                      ),
                                      label: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("To Date"),
                                      ) //label text of field
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sel1 = !sel1;
                                sel2 = false;
                                sel3 = false;
                              });
                            },
                              child: chip('Both', Colors.black, sel1)
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  sel2 = !sel2;
                                  sel1 = false;
                                  sel3 = false;
                                });
                              },
                              child: chip('Paid', Colors.black,sel2)
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  sel3 = !sel3;
                                  sel1 = false;
                                  sel2 = false;
                                });
                              },
                              child: chip('Not Paid', Colors.black,sel3)
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: OutlinedButton(
                                onPressed: () {
                                  handleFilters();
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                  )
                                ),
                                child: const Text("Apply")
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
