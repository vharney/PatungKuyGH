import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';
import 'order_list.dart';
import 'package:patungkuy/models/brew.dart';

class Order extends StatelessWidget {
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

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('PatungKuy'),
          backgroundColor: Colors.brown[400],
          leading: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              DrawerHeader(
                child: Icon(Icons.menu),
                decoration: BoxDecoration(
                  color: Colors.white30,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ]),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(content: Text('tap'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.more_vert),
                )),
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
