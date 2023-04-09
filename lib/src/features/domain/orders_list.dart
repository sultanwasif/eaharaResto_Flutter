
import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        children: const [
          Text("Data 1"),
          Text("Data 2"),
          Text("Data 3"),
        ],
      ),
    );
  }
}
