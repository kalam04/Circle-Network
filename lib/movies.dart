import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'mainDrawer.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Movies',style: TextStyle(fontSize: w/15),)),centerTitle: true,backgroundColor: Color(0xffFF7F50),),
      body: SafeArea(
        child: WebView(
          initialUrl: "http://circleftp.net",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}