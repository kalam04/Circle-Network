import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bkashPayment.dart';
import 'home.dart';
import 'package.dart';

class MobileBanking extends StatefulWidget {
  @override
  _MobileBankingState createState() => _MobileBankingState();
}

class _MobileBankingState extends State<MobileBanking> {
  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(x/15),
          child: new AppBar(title: Text('Mobile Banking',style: TextStyle(fontSize: x/30),),backgroundColor: Color(0xffFF7F50),centerTitle: true,leadingWidth: 30,)),
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
                                : Colors.grey.shade400,
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
                                  : Colors.grey.shade400,
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
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.payment,
                              color: currentIndex == 3
                                  ? Colors.orange
                                  : Colors.grey.shade400,
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
                  items: [
                    Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                      ),
                      child: Image.asset("assets/images/Bkash 1.png",),
                    ),
                    Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                      ),
                      child: Image.asset("assets/images/Bkash 2.png",),
                    ),
                    Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
                      ),
                      child: Image.asset("assets/images/Bkash 3.png"),
                    ),

                  ],
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height*.95,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: mainDrawer(),


    );
  }
}
