import 'package:flutter/material.dart';
import 'package:patungkuy/screens/home/add_order.dart';
import 'package:patungkuy/shared/appbar.dart';
import 'package:provider/provider.dart';
import 'package:patungkuy/screens/home/confirmed.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/screens/home/mycart.dart';
import 'package:patungkuy/shared/constants.dart';
import 'package:patungkuy/shared/drawer.dart';
import 'order_list.dart';
import 'package:patungkuy/services/database.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:patungkuy/models/order.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _pages = [Orders(), MyCart(), Confirmed()];
  PageController pageController = PageController(initialPage: 0);
  int selecteditem = 0;

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

    return Scaffold(
      drawer: DrawerCustom(
        email: userEmail,
      ),
      appBar: AppBar(
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
      ),
      body: PageView(
        controller: pageController,
        children: _pages,
        onPageChanged: (value) => setState(() {
          selecteditem = value;
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Orders')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text('My Cart')),
          BottomNavigationBarItem(
              icon: Icon(Icons.check), title: Text('Confirmed'))
        ],
        currentIndex: selecteditem,
        onTap: (value) {
          setState(() {
            selecteditem = value;
            pageController.animateToPage(selecteditem,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInExpo);
          });
        },
      ),
    );
  }
}
