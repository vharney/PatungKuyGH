import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/services/database.dart';
import 'package:patungkuy/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patungkuy/shared/loading.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
  
    final CollectionReference userCollection =
      Firestore.instance.collection('users');

    
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      initialData: UserData(uid: 'test', email: 'email', balance: 0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData data = snapshot.data;
          return Scaffold(
          appBar: AppBar(
            title: Text('Account'),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 50.0,
                ),
                Divider(
                  height: 30.0,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${data.balance}',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                FlatButton.icon(
                  onPressed: () async {
                    await userCollection.document(user.uid).setData({
                        'name': data.email ?? 'email',
                        'email': data.email ?? 'real email',
                        'balance': data.balance ?? 100});
                    },
                    
                  label: Text(
                    'Top Up',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        );
        } else {
          return Container();
        }
      }
    );
  }
}
