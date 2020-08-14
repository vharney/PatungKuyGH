import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';
import 'order_list.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/screens/authenticate/authenticate.dart';

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
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('PatungKuy'),
          backgroundColor: Colors.blue[300],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.add),
              label: Text('add order'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Juan'),
              accountEmail: Text('juanislam@gmail.com'),
              currentAccountPicture: CircleAvatar(),
            ),
            DrawerHeader(
              child: Icon(Icons.menu),
              decoration: BoxDecoration(
                color: Colors.white30,
              ),
            ),
            ListTile(
              leading: FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              // Update the state of the app.
              // ...
            ),
            ListTile(
              leading: FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Account'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
