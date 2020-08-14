import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';

class DrawerCustom extends StatefulWidget {
  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              await AuthService().signOut();
            },
          ),
          // Update the state of the app.
          // ...
        ),
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Account'),
            onPressed: () async {},
          ),
        ),
      ]),
    );
  }
}
