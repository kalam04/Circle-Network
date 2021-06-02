import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bkashPayment.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';

class bkashPayment extends StatefulWidget {
  @override
  _bkashPaymentState createState() => _bkashPaymentState();
}

class _bkashPaymentState extends State<bkashPayment> {

  int currentIndex = 3;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var x = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height/15),
            child: new AppBar(
              title: Text(
                'Payment With Bkash',
                style: TextStyle(fontSize: x / 30),
              ),
              backgroundColor: Colors.deepPurpleAccent,
              centerTitle: true,
              leadingWidth: 30,
            )),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.deepPurpleAccent,
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
                                    ? Colors.black
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
                child: SafeArea(
                  // child: WebView(
                  //   initialUrl: "https://circlenetworkbd.net/bill-payment/",
                  //   javascriptMode: JavascriptMode.unrestricted,
                  // ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: .6,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        autoPlay: true,
                      ),
                      items: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                          ),
                          child: Image.asset(
                            "assets/images/Bkash 1.png",
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                          ),
                          child: Image.asset(
                            "assets/images/Bkash 2.png",
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                          ),
                          child: Image.asset("assets/images/Bkash 3.png"),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
        drawer: mainDrawer(),
      );
    } else {
      setState(() {
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      });
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height/9),
            child: new AppBar(
              title: Text(
                'Payment With Bkash',
                style: TextStyle(fontSize: w / 30),
              ),
              backgroundColor: Colors.deepPurpleAccent,
              centerTitle: true,
              leadingWidth: 30,
            )),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.deepPurpleAccent,
                width: size.width,
                height: size.height/9,
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
                      height: size.height/9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            elevation: 0,
                            disabledColor: Colors.transparent,
                            child: IconButton(
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
                          ),
                          RaisedButton(
                            elevation: 0,
                            disabledColor: Colors.transparent,
                            child: IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: currentIndex == 1
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                                onPressed: () {
                                  launch("tel:+09611800900");
                                }),
                          ),
                          // Container(
                          //   width: size.width * 0.20,
                          // ),
                          RaisedButton(
                            elevation: 0,
                            disabledColor: Colors.transparent,
                            child: IconButton(
                                icon: Icon(
                                  Icons.camera,
                                  color: currentIndex == 2
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                                }),
                          ),
                          RaisedButton(
                            elevation: 0,
                            disabledColor: Colors.transparent,
                            child: IconButton(
                                icon: Icon(
                                  Icons.payment,
                                  color: currentIndex == 3
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
                                }),
                          ),
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
              height: size.height-(size.height/9+size.height/9),
              width: size.width,
              child: Container(

                child: SafeArea(

                    child: CarouselSlider(

                      options: CarouselOptions(
                        aspectRatio: .6,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        autoPlay: false,
                      ),
                      items: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                          ),
                          child: Image.asset(
                            "assets/images/Bkash 1.png",
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                          ),
                          child: Image.asset(
                            "assets/images/Bkash 2.png",
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                          ),
                          child: Image.asset("assets/images/Bkash 3.png"),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
        drawer: mainDrawer(),
      );
    }
  }
}


class NoonLoopingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noon-looping carousel demo')),
      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                ),
                child: Image.asset(
                  "assets/images/Bkash 1.png",
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                ),
                child: Image.asset(
                  "assets/images/Bkash 2.png",
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                ),
                child: Image.asset("assets/images/Bkash 3.png"),
              ),
            ],
          )
      ),
    );
  }
}
