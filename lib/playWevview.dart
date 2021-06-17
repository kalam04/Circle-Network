import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bkashPayment.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';


class WebviewRun extends StatefulWidget {
  var appbartext,urlString;
  WebviewRun({this.appbartext,this.urlString});
  @override
  _WebviewRunState createState() => _WebviewRunState(appbartext,urlString);
}

class _WebviewRunState extends State<WebviewRun> {
  _WebviewRunState(appbartext, urlString);
  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(x/15),
          child: new AppBar(
            iconTheme: IconThemeData(
                color: Colors.black //change your color here
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Image.asset("assets/images/cn.png"),
              )
            ],
            backgroundColor: Colors.blueGrey[100],
            title: Text(widget.appbartext.toString(),
              style: TextStyle(fontSize: x/30,color: Colors.black),),
            centerTitle: true,leadingWidth: 30,)),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: Colors.blueGrey[100],
              width: size.width,
              height: size.height/15,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  // CustomPaint(
                  //   size: Size(size.width, 80),
                  //   painter: BNBCustomPainter(),
                  // ),
                  // Center(
                  //   heightFactor: 0.6,
                  //   child: FloatingActionButton(backgroundColor: Colors.orange, child: Icon(Icons.shopping_basket), elevation: 0.1,
                  //       onPressed: () {}),
                  // ),
                  Container(
                    width: size.width,
                    height: size.height/15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: currentIndex == 0
                                ? Colors.orange
                                : Colors.grey[400],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()),
                            );
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.call,
                              color: currentIndex == 1
                                  ? Colors.orange
                                  : Colors.grey[400],
                            ),
                            onPressed: () {

                              launch("tel:+09611800900");

                            }),
                        // Container(
                        //   width: size.width * 0.20,
                        // ),
                        IconButton(
                            icon: Icon(
                              Icons.camera,
                              color: currentIndex == 2
                                  ? Colors.orange
                                  : Colors.grey[400],
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.payment,
                              color: currentIndex == 3
                                  ? Colors.orange
                                  : Colors.grey[400],
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            height: size.height-(size.height/15+size.height/15
                +MediaQuery.of(context).padding.top),
            width: size.width,
            child: Container(
              child: SafeArea(
                child: WebView(
                  initialUrl: widget.urlString.toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}