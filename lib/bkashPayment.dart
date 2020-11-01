import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class bkashPayment extends StatefulWidget {
  @override
  _bkashPaymentState createState() => _bkashPaymentState();
}

class _bkashPaymentState extends State<bkashPayment> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Payment With Bkash')),backgroundColor: Colors.deepPurpleAccent,centerTitle: true,),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://circlenetworkbd.net/bill-payment/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      drawer: mainDrawer(),


    );
  }
}