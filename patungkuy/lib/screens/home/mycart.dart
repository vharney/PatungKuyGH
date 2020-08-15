import 'package:flutter/material.dart';
import 'package:patungkuy/models/temp_order.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'package:patungkuy/shared/constants.dart';
<<<<<<< HEAD
import 'package:patungkuy/services/auth.dart';
=======
import 'package:patungkuy/screens/home/add_order.dart';
>>>>>>> be148a2dee774c900c00cab13ac730ef7ae6b835

class MyCart extends StatefulWidget {
  List<TempOrder> listOfTempOrders;
  MyCart({this.listOfTempOrders});
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void _addOrderPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: AddOrder(),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
<<<<<<< HEAD
      appBar: AppbarCustom().build(context),
      drawer: DrawerCustom(email: userEmail,),//DrawerCustom(email: userEmail),
=======
=======
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text('ADD ORDER'),
            onPressed: () => _addOrderPanel(),
          )
        ],
      ),
      backgroundColor: Colors.blue[100],
>>>>>>> be148a2dee774c900c00cab13ac730ef7ae6b835
      drawer: DrawerCustom(email: userEmail),
>>>>>>> 40e35214e28ed0176af5a39be7ce14349b9020ac
    );
  }
}
