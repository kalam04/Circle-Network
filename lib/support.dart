import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Support')),centerTitle: true,),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://circlenetworkbd.net/support/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}