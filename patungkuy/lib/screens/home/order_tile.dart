import 'package:flutter/material.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/models/brew.dart';

class OrderTile extends StatelessWidget {
  
  final Order order;
  OrderTile({ this.order });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[order.strength],
          ),
          title: Text(order.name),
          subtitle: Text("Takes ${order.sugars} sugar(s)."),
        )
      )
    );
  }
}