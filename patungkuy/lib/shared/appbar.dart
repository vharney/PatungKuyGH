import 'package:flutter/material.dart';

import 'package:patungkuy/main.dart';
import 'package:patungkuy/screens/home/mycart.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/screens/home/confirmed.dart';
import 'package:patungkuy/screens/home/add_order.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/screens/authenticate/authenticate.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/appbar.dart';

class AppbarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _addOrderPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: AddOrder(),
            );
          });
    }

    return AppBar(
      title: Text('PatungKuy'),
      backgroundColor: Colors.blue[300],
      elevation: 0.0,
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('ADD ORDER'),
          onPressed: () => _addOrderPanel(),
        )
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.attach_money),
                  label: Text('Orders'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Orders()),
                    );
                    print('hello');
                    print('CONTEXT $context');
                    print('world');
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.shopping_cart),
                  label: Text('My Cart'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart()),
                    );
                    print('hello');
                    print('CONTEXT $context');
                    print('world');
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.check_circle),
                  label: Text('Confirmed'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Confirmed()),
                    );
                    print('hello');
                    print('CONTEXT $context');
                    print('world');
                  },
                ),
              ])),
    );
  }
}
