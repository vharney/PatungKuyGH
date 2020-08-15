import 'package:flutter/material.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/constants.dart';
import 'package:patungkuy/services/auth.dart';

class MyCart extends StatefulWidget {
  List<TempOrder> listOfTempOrders;
  MyCart({this.listOfTempOrders});
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppbarCustom().build(context),
      drawer: DrawerCustom(email: userEmail,),//DrawerCustom(email: userEmail),
=======
      drawer: DrawerCustom(email: userEmail),
>>>>>>> 40e35214e28ed0176af5a39be7ce14349b9020ac
    );
  }
}
