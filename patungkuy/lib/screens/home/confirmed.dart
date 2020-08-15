import 'package:flutter/material.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/constants.dart';
import 'package:patungkuy/screens/home/add_order.dart';

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  @override
  void _addOrderPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: AddOrder(),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      drawer: DrawerCustom(email: userEmail),
    );
  }
}
