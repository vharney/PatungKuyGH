import 'package:flutter/material.dart';

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
    );
  }
}
