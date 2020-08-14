import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';
import 'order_list.dart';
import 'package:patungkuy/models/order.dart';

class Orders extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: Text('bottom sheet'),
            );
          });
    }

    return StreamProvider<List<Order>>.value(
      value: DatabaseService().orders,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('PatungKuy'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('add order'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FlatButton.icon(
                      color: Colors.white,
                      icon: Icon(Icons.person),
                      label: Text('Orders'),
                      onPressed: () async {},
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.person),
                      label: Text('My Cart'),
                      onPressed: () async {},
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.person),
                      label: Text('Confirmed'),
                      onPressed: () async {},
                    ),
                  ])),
        ),
        body: OrderList(),
      ),
    );
  }
}
