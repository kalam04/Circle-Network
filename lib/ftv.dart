import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'mainDrawer.dart';

class FTV extends StatefulWidget {
  @override
  _FTVState createState() => _FTVState();
}

class _FTVState extends State<FTV> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('FTP Server',style: TextStyle(fontSize: w/15),)),centerTitle: true,backgroundColor: Color(0xffFF7F50),),
      body: SafeArea(
        child: WebView(
          initialUrl: "http://ftp4.circleftp.net/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}