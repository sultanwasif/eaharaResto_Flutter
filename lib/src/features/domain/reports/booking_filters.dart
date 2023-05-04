import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
