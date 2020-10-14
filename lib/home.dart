import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainDrawer.dart';
import 'livetv.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .popupMenuTheme.color;

    final appBar=AppBar(
      title: Text('Circle Network'),
      backgroundColor: Colors.orangeAccent,
    );

    Widget gridSection = Container(
      child: GridView.count(

        shrinkWrap: true,
        primary: false,
        crossAxisCount: 3,
        children: <Widget>[
          new Container(
            child: new Card(
              elevation: 0,
              color: Colors.transparent,

              child: new InkResponse(
                child: new Column(
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/livetv.png', height:100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Live Tv', style: TextStyle(fontSize: 18),)
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LiveTv()),
                  );
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
                color: Colors.transparent,
                child: new InkResponse(
                  child: new Column(
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/ftpserver.png', height: 100,
                        width: 100,),
                      new SizedBox(height: 5,),
                      new Text('FTP Server', style: TextStyle(fontSize: 18),)

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
              color: Colors.transparent,
              child: new InkResponse(
                child: new Column(
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/movie.png', height: 100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Movies', style: TextStyle(fontSize: 18),),

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
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/cash.png', height: 100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Cash Payment', style: TextStyle(fontSize: 18),),
                  ],
                ),
                onTap: () {
                  debugPrint('work Cash payment');
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/mb.png', height: 100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Mobile banking', style: TextStyle(fontSize: 18),),
                  ],
                ),
                onTap: () {
                  debugPrint('Mobile banking');
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/bksh.png', height: 100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Bkash Payment', style: TextStyle(fontSize: 18),),
                  ],
                ),
                onTap: () {
                  debugPrint('Bkash Payment');
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/help.png', height: 100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Help Line', style: TextStyle(fontSize: 18),),
                  ],
                ),
                onTap: () {
                  debugPrint('Help Line');
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/support.png', height: 100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Support', style: TextStyle(fontSize: 18),),
                  ],
                ),
                onTap: () {
                  debugPrint('Support');
                },
              ),
            ),
          ),
          new Container(
            child: new Card(
              color: Colors.transparent,
              child: InkResponse(
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/partner.png', height: 100, width: 100,),
                    new SizedBox(height: 5,),
                    new Text('Website', style: TextStyle(fontSize: 18),),
                  ],
                ),
                onTap: () {
                  debugPrint('Website');
                },
              ),
            ),
          ),

        ],
      ),
    );


    return MaterialApp(
      title: 'Circle Network',

      home: Scaffold(
        backgroundColor: Color(0xffFCDFFF),

        appBar: appBar,
        drawer: mainDrawer(),
        body: ListView(

          children: [

            Container(
              width: 20,
              height: MediaQuery.of(context).size.height*.3,
              child: Image.asset(
                'assets/images/cn4.png',

                fit: BoxFit.cover,
              ),
            ),
            // textSection,
            gridSection,
          ],
        ),
      ),

    );
  }
}
