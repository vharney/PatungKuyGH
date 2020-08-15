import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      body: PageView(
        controller: pageController,
        children: _pages,
        onPageChanged: (value) => setState(() {
          selecteditem = value;
        }),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70.0,
        color: Colors.white,
        backgroundColor: Colors.blue[100],
        buttonBackgroundColor: Colors.blue[400],
        items: <Widget>[
          Icon(
            Icons.home,
          ),
          Icon(
            Icons.shopping_cart,
          ),
          Icon(
            Icons.check,
          ),
        ],
        animationCurve: Curves.easeOutCubic,
        onTap: (value) {
          setState(() {
            selecteditem = value;
            pageController.animateToPage(selecteditem,
                duration: Duration(milliseconds: 400), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
