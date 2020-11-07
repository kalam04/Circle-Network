import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'mainDrawer.dart';


class WebviewRun extends StatefulWidget {
  var appbartext,urlString;
  WebviewRun({this.appbartext,this.urlString});
  @override
  _WebviewRunState createState() => _WebviewRunState(appbartext,urlString);
}

class _WebviewRunState extends State<WebviewRun> {
  _WebviewRunState(appbartext, urlString);

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text(widget.appbartext.toString(),style: TextStyle(fontSize: w/15),)),centerTitle: true,),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.urlString.toString(),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}