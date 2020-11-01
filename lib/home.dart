import 'package:circle_network/contact.dart';
import 'package:circle_network/support.dart';
import 'package:circle_network/website.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bkashPayment.dart';
import 'mainDrawer.dart';
import 'livetv.dart';
import 'mobileBanking.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


    Color color = Theme
        .of(context)
        .popupMenuTheme.color;

    final appBar=AppBar(
      title: SafeArea(child: Text('Circle Network')),
      backgroundColor: Colors.cyan,
      centerTitle: true,
    );


    Widget gridSection = Container(
      //height: MediaQuery.of(context).size.height*7-appBar.preferredSize.height),
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        children: <Widget>[
          new Container(
            //height: MediaQuery.of(context).size.height,
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: new InkResponse(
                child: new Column(
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                    new SizedBox(height: 3,),
                    Flexible(child: new AutoSizeText('Live Tv',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),minFontSize: 10,)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTv1()),);
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
                elevation: 0,
                color: Colors.transparent,
                child: new InkResponse(
                  child: new Column(
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/ftp.png', height: MediaQuery.of(context).size.height/12,
                        width: 100,),
                      new SizedBox(height: 3,),
                      Flexible(child: new AutoSizeText('FTP Server',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),minFontSize: 10,stepGranularity: 10,)),

                    ],
                  ),
                  onTap: () {
                    debugPrint('work ftp');
                  },
                )
            ),
          ),
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: new InkResponse(
                child: new Column(
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/movie.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                    new SizedBox(height: 3,),
                    Flexible(child: new AutoSizeText('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),minFontSize: 10,)),

                  ],
                ),
                onTap: () {
                  debugPrint('work movies');
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/cash.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                    new SizedBox(height: 3,),
                    Flexible(child: new AutoSizeText('Cash Payment', textAlign: TextAlign.center,style: TextStyle(fontSize: 18),minFontSize: 10,)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Help()),);
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/mb.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                    new SizedBox(height: 3,),
                    Flexible(child: new AutoSizeText('Mobile banking',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),minFontSize: 10,)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MobileBanking()),);
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    Container(
                      child: new Image.asset(
                        'assets/images/bksh.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                    ),
                    new SizedBox(height: 3,),
                    Flexible(child: AutoSizeText("Bkash Payment",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),minFontSize: 10,maxLines: 2,)),

                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => bkashPayment()));
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/help.png', height: MediaQuery.of(context).size.height/11, width: 100,),
                    new SizedBox(height: 3,),
                    Flexible(child: new AutoSizeText('Help Line',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Help()),);
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/pack.png', height: MediaQuery.of(context).size.height/11, width: 100,),
                    new SizedBox(height: 3,),
                    Flexible(child: new AutoSizeText('Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/partner.png', height: MediaQuery.of(context).size.height/11, width: 100,),
                    new SizedBox(height: 3,),
                    Flexible(child: new Text('Website',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Wevsite()));
                },
              ),
            ),
          ),

        ],
      ),
    );


    return Scaffold(
      backgroundColor: Color(0xffFCDFFF,),
      appBar: appBar,
      drawer: SafeArea(child: mainDrawer()),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(

                child: Image.asset(
                  'assets/images/cn4.png',
                  fit: BoxFit.cover,height: MediaQuery.of(context).size.height*.35,
                ),
              ),
              // textSection,
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                // height: MediaQuery.of(context).size.height-(MediaQuery.of(context).
                // size.height*.3+appBar.preferredSize.height+appBar.preferredSize.height-MediaQuery.of(context).padding.bottom),
                child: gridSection,

              )
            ],
          ),
        ),
      ),
    );
  }
}
