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
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.jpg'),
          ),
        ),
        ListTile(
          title: Text('Log out'),
          trailing: Icon(Icons.power_settings_new),
          onTap: () async {
            await AuthService().signOut();
          },
          // Update the state of the app.
          // ...
        ),
      ]),
    );
  }
}
