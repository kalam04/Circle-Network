import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MobileBanking extends StatefulWidget {
  @override
  _MobileBankingState createState() => _MobileBankingState();
}

class _MobileBankingState extends State<MobileBanking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Mobile Banking')),centerTitle: true,),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://circlenetworkbd.net/bill-payment/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}