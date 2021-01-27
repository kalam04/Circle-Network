import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class bkashPayment extends StatefulWidget {
  @override
  _bkashPaymentState createState() => _bkashPaymentState();
}

class _bkashPaymentState extends State<bkashPayment> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var x = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(x / 13),
            child: new AppBar(
              title: Center(
                  child: Text(
                'Payment With Bkash',
                style: TextStyle(fontSize: x / 30),
              )),
              backgroundColor: Colors.deepPurpleAccent,
              centerTitle: true,
              leadingWidth: 0,
            )),
        body: SafeArea(
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
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .95,
              enlargeCenterPage: true,
              autoPlay: false,
            ),
          ),
        ),
        drawer: mainDrawer(),
      );
    } else {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(w / 16),
            child: new AppBar(
              title: Center(
                  child: Text(
                'Payment With Bkash',
                style: TextStyle(fontSize: w / 30),
              )),
              backgroundColor: Colors.deepPurpleAccent,
              centerTitle: true,
              leadingWidth: 0,
            )),
        body: SafeArea(
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
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .95,
              enlargeCenterPage: true,
              autoPlay: false,
            ),
          ),
        ),
        drawer: mainDrawer(),
      );
    }
  }
}
