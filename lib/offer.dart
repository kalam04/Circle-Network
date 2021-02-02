import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bkashPayment.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';

class Offer extends StatefulWidget {
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {

  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var x=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(x/15),
          child: new AppBar(title: Center(child: Text('Packages',style: TextStyle(fontSize: x/30),)),centerTitle: true,leadingWidth: 0,)),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: Color(0xffFF7F50),
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
                                : Colors.white,
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
                                  : Colors.white,
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
                                  : Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.payment,
                              color: currentIndex == 3
                                  ? Colors.orange
                                  : Colors.white,
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
              child: WebView(
                initialUrl: "https://circlenetworkbd.net/offer/",
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ),
        ],
      ),
      drawer: SafeArea(child: mainDrawer()),


    );
  }
}