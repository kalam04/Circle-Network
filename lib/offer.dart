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
    var x=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),
          child: new AppBar(title: Center(child: Text('Packages',style: TextStyle(fontSize: x/30),)),centerTitle: true,leadingWidth: 0,)),
      body: WebView(
        initialUrl: "https://circlenetworkbd.net/offer/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}