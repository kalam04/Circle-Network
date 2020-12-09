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
    var x=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),child: new AppBar(title: Center(child: Text(widget.appbartext.toString(),style: TextStyle(fontSize: x/30),)),centerTitle: true,)),
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