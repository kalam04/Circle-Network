import 'package:flutter/material.dart';

class package extends StatefulWidget {
  @override
  _packageState createState() => _packageState();
}

class _packageState extends State<package> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Our Package'),),
      body: Center(child: Text('Package page'),),


    );
  }
}