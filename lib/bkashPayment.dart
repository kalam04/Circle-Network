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
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Payment With Bkash',style: TextStyle(fontSize: w/15),)),backgroundColor: Colors.deepPurpleAccent,centerTitle: true,),
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
              child: Image.asset("assets/images/Bkash 1.png",width: 500,),
            ),
            Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(15)),
                //image: DecorationImage(image: AssetImage('assets/images/bkash3.png'),fit: BoxFit.cover,),
              ),
              child: Image.asset("assets/images/Bkash 2.png",width: 600,),
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
      drawer: mainDrawer(),


    );
  }
}