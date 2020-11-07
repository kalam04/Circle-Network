import 'package:circle_network/playWevview.dart';
import 'package:flutter/material.dart';
import 'bkashPayment.dart';
import 'contact.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';

class LiveTv extends StatefulWidget {
  @override
  _LiveTvState createState() => _LiveTvState();
}

class _LiveTvState extends State<LiveTv> {

  final appBar=AppBar(
    title: Text('Circle Network'),
    centerTitle: true,
    backgroundColor: Colors.cyan,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SafeArea(child: new Text('Live Tv')),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Live TV'),
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),
    );
  }
}

class LiveTv1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var appbartext1="BDIPTV",appbartext2="RANGDHANU LIVE",appbartext3="LIVE TV";
    var urlString1="http://bdiptv.net/",urlString2="http://bdiptv.net/",urlString3="http://www.jagobd.com/btvworld";


    Widget gridSection = Container(
      padding: EdgeInsets.all(20),

      //height: MediaQuery.of(context).size.height*7-appBar.preferredSize.height),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WebviewRun(appbartext: appbartext1,urlString: urlString1,)));
              },
              child: new Container(
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: Offset(-3, -3),
                    //       color: Color(0xffA2CAEF).withOpacity(0.2),
                    //       spreadRadius: 6,
                    //       blurRadius: 6)
                    // ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffd2d2d2).withOpacity(0.6),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffc0c0c0),
                          Color(0xffFFFEDC),
                          //Color(0xffFFA500)
                        ])
                ),
                child: Column(
                  children: [
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("BDIPTV", style: TextStyle(
                            color: Colors.black,
                            fontSize: w/15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Image.asset('assets/images/unnamed.png',height: h/5,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WebviewRun(appbartext: appbartext2,urlString: urlString2,)));
              },
              child: new Container(
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: Offset(-3, -3),
                    //       color: Color(0xffA2CAEF).withOpacity(0.2),
                    //       spreadRadius: 6,
                    //       blurRadius: 6)
                    // ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffd2d2d2).withOpacity(0.6),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffc0c0c0),
                          Color(0xffFFFEDC),
                          //Color(0xffFFA500)
                        ])
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("RANGDHANU LIVE", style: TextStyle(
                            color: Colors.black,
                            fontSize: w/15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset('assets/images/rangdhanu.gif',height: h/4,),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WebviewRun(appbartext: appbartext3,urlString: urlString3,)));
              },
              child: new Container(

                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: Offset(-3, -3),
                    //       color: Color(0xffA2CAEF).withOpacity(0.2),
                    //       spreadRadius: 6,
                    //       blurRadius: 6)
                    // ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffd2d2d2).withOpacity(0.6),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffc0c0c0),
                          Color(0xffFFFEDC),
                          //Color(0xffFFA500)
                        ])
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("LIVE TV", style: TextStyle(
                            color: Colors.black,
                            fontSize: w/15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset('assets/images/live.png',height: h/4,width: w/2,),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );

    return Scaffold(
      appBar: new AppBar(title: SafeArea(child: Text('Live Tv',style: TextStyle(fontSize: w/15),)),centerTitle: true,backgroundColor: Color(0xffFF7F50),),
      body: SafeArea(
        child: Container(

          child: gridSection,
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),
    );
  }
}