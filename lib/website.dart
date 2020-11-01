import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wevsite extends StatefulWidget {
  @override
  _WevsiteState createState() => _WevsiteState();
}

class _WevsiteState extends State<Wevsite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Website')),centerTitle: true,),
      body: WebView(
        initialUrl: "https://circlenetworkbd.net/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}