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
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),
          child: new AppBar(title: Center(child: Text('Website',style: TextStyle(fontSize: x/30),)),centerTitle: true,leadingWidth: 30,)),
      body: WebView(
        initialUrl: "http://holyquran.massgroupbd.com/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}