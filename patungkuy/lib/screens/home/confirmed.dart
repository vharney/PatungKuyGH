import 'package:flutter/material.dart';
import 'package:patungkuy/shared/appbar.dart';

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom().build(context),
    );
  }
}
