import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';

class bkashPayment extends StatefulWidget {
  @override
  _bkashPaymentState createState() => _bkashPaymentState();
}

class _bkashPaymentState extends State<bkashPayment> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('PayMent With Bkash'),),
      body: Center(
        child: Text('Bkash Payment page'),
      ),
      drawer: mainDrawer(),
    );
  }
}