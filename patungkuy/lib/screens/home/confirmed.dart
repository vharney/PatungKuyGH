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

  var titles = ['chicken', 'sapi', 'plastic', 'juan'];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(titles[0]),
                Text('10000'),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
