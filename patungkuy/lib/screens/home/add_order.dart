import 'package:flutter/material.dart';
import 'package:patungkuy/services/database.dart';
import 'package:patungkuy/shared/constants.dart';
import 'package:uuid/uuid.dart';

class AddOrder extends StatefulWidget {
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  final _formKey = GlobalKey<FormState>();
  final List<String> items = ['Egg', 'Milk', 'Chicken', 'Plastic', 'Cardboard'];

  String _selectedItems;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Card(
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select The Items You Want to Add',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0),
            child: DropdownButtonFormField(
              decoration: textInputDecoration,
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text('$item'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _selectedItems = val),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  setState(() {
                    ++counter;
                  });
                },
              ),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Qty: ' + counter.toString()),
              )),
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  setState(() {
                    if (counter > 0) {
                      --counter;
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () async {
              String uid = uuid.v4();
              DatabaseService ds = DatabaseService(uid: uuid.v4());
              print(await ds.itemExist(_selectedItems));
              if (! await ds.itemExist(_selectedItems)) {
                await DatabaseService(uid: uuid.v4()).updateUserData(_selectedItems,  20, counter, 'juan');
              }
              
            },
            color: Colors.blue[300],
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
