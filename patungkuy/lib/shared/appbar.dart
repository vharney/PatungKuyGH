import 'package:flutter/material.dart';
import 'package:patungkuy/screens/home/add_order.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/screens/home/confirmed.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/screens/home/mycart.dart';
import 'package:patungkuy/shared/drawer.dart';

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
                  icon: Icon(Icons.person),
                  label: Text('Orders'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.pushNamed(
                      context,
                      '/orders',
                    );
                    print('hello');
                    print('CONTEXT $context');
                    print('world');
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('My Cart'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.pushNamed(
                      context,
                      '/mycart',
                    );
                    print('hello');
                    print('CONTEXT $context');
                    print('world');
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Confirmed'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.pushNamed(
                      context,
                      '/confirmed',
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
