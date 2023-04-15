
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/sizes.dart';
import 'package:flutterapp/src/constants/text.dart';
import 'package:flutterapp/src/features/domain/products/product_dto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen ({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<ShopItems> shopItems = [];
  late bool _isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems();
  }

  getItems() async {
    if (mounted) {
      setState(() {
        _isInit = true;
      });
    }
    final SharedPreferences prefs = await _prefs;
    var shopId = prefs.getString('shopId').toString();
     http.Response response = await http.get(Uri.parse('${tBasePath}GetShopItemsByShopId$tSlash$shopId'),
    headers: tHeaders);
    List<dynamic> tempShopItems = jsonDecode(response.body);
    for (int index = 0; index < tempShopItems.length; index++ ) {
      shopItems.add(ShopItems.fromJson(tempShopItems[index]));
    }
    if (mounted) {
      setState(() {
        _isInit = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _isInit == false ? Column(
        children: [
          const Text("Product List"),
          const SizedBox(height: tDefaultSize -10,),
          Expanded(
            child: ListView.builder(
              itemCount: shopItems.length,
                itemBuilder: (BuildContext context, int index ) {
              return Card(
                child: Column(
                  children: [
                    Text(shopItems[index].name.toString()),
                    Text(shopItems[index].price.toString()),
                    Text(shopItems[index].itemsCategory!.name.toString())
                  ],
                ),
              );
            } ),
          ),
        ],
      ): const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
