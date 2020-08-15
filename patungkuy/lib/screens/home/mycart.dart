import 'package:flutter/material.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/constants.dart';

class MyCart extends StatefulWidget {
  List<TempOrder> listOfTempOrders;
  MyCart({this.listOfTempOrders});
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<String> myCart = ['Egg', 'Chicken', 'Plastic'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(email: userEmail),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Card(
              child: ListView.builder(
                itemCount: myCart.length,
                itemBuilder: (context, index) {
                  return Text(myCart[index]);
                },
              ),
            ),
          ),
          Expanded(flex: 2, child: Text('THE TOTAL')),
        ],
      ),
    );
  }
}
