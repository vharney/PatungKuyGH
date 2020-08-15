import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patungkuy/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/models/user.dart';

class DrawerCustom extends StatefulWidget {
  final String email;
  DrawerCustom({this.email});

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Juan'),
          accountEmail: Text(user.email),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.jpg'),
          ),
          onDetailsPressed: () {
            print(widget.email);
            Navigator.pushNamed(context, '/account');
          },
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
