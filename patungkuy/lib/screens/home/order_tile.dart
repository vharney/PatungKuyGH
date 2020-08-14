import 'package:flutter/material.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/models/brew.dart';

class OrderTile extends StatefulWidget {
  final Order order;
  OrderTile({this.order});

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  int counter = 0;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              title: Text(widget.order.name),
              subtitle: Text('Rp ' + widget.order.price.toString()),
              trailing: Card(
                elevation: 5.0,
                color: Colors.grey[50],
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              leading: CircleAvatar(
                radius: 100.0,
                //backgroundImage: AssetImage('assets/${order.image}'),
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.order.category,
                    textAlign: TextAlign.right,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter += 1;
                      print(counter);
                    });
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
                Text('Qty: $counter'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 0) {
                        counter -= 1;
                      }
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
              ],
            ),
          ],
        ),
        elevation: 10.0,
      ),
    );
  }
}