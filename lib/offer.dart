import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'mainDrawer.dart';

class Offer extends StatefulWidget {
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Packages')),centerTitle: true,),
      body: WebView(
        initialUrl: "https://circlenetworkbd.net/offer/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}