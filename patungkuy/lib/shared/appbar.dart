import 'package:flutter/material.dart';
import 'package:patungkuy/main.dart';
import 'package:patungkuy/screens/home/mycart.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/screens/home/confirmed.dart';

class AppbarCustom extends StatelessWidget {
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

    return AppBar(
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
                  icon: Icon(Icons.person),
                  label: Text('Orders'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Orders()),
                    );
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('My Cart'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart()),
                    );
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Confirmed'),
                  onPressed: () async {
                    color:
                    Colors.white;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Confirmed()),
                    );
                  },
                ),
              ])),
    );
  }
}
