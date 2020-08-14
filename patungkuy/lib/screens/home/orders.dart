import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';
import 'order_list.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/screens/authenticate/authenticate.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/appbar.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppbarCustom().build(context),
        body: OrderList(),
        drawer: DrawerCustom(),
      ),
    );
  }
}
