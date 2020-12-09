import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MobileBanking extends StatefulWidget {
  @override
  _MobileBankingState createState() => _MobileBankingState();
}

class _MobileBankingState extends State<MobileBanking> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),child: new AppBar(title: Center(child: Text('Mobile Banking',style: TextStyle(fontSize: x/30),)),backgroundColor: Color(0xffFF7F50),centerTitle: true,)),
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
      drawer: mainDrawer(),


    );
  }
}
