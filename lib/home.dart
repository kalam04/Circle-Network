import 'dart:convert';

import 'package:circle_network/contact.dart';
import 'package:circle_network/ftv.dart';
import 'package:circle_network/movies.dart';
import 'package:circle_network/support.dart';
import 'package:circle_network/website.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'bkashPayment.dart';
import 'cashPayment.dart';
import 'mainDrawer.dart';
import 'livetv.dart';
import 'mobileBanking.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package.dart';
import 'package:http/http.dart'as http;

class Home extends StatefulWidget {
  var data,address;
  Home({this.data,this.address});
  @override
  _HomeState createState() => _HomeState(data,address);
}

class _HomeState extends State<Home> {

  _HomeState(data, address);
  // var data;
  //
  // Future getvalue()async{
  //   var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
  //   setState(() {
  //     var decode=json.decode(response.body);
  //     data=decode;
  //     //print(widget.a);
  //     //debugPrint('x=$x');
  //
  //   });
  // }

  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  Future<void> _deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if(appDir.existsSync()){
      appDir.deleteSync(recursive: true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.getvalue();
    this._deleteAppDir();
    this._deleteCacheDir();
  }

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;


    Color color = Theme
        .of(context)
        .popupMenuTheme.color;

    AppBar appBar_protrat=AppBar(
      title: Center(child: Text('Circle Network',style: TextStyle(fontSize: x/30),)),
      backgroundColor: Color(0xffFF7F50),
      centerTitle: true,
      leadingWidth: 0,
    );
    AppBar appBar_landscope=AppBar(
      title: Center(child: Text('Circle Network',style: TextStyle(fontSize: w/30),)),
      backgroundColor: Color(0xffFF7F50),
      centerTitle: true,
      leadingWidth: 0,

    );

    var wi=MediaQuery.of(context).size.width;
    Widget gridSection = Container(
      //height: MediaQuery.of(context).size.height*7-appBar.preferredSize.height),
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 3,
        childAspectRatio: 1,
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
                    new Text('Live Tv',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22)),
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
                      new Text('FTP Server',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FTV()));
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
                    new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22)),

                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SamplePlayer()));
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
                    new Text('Cash Payment', textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment()),);
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
                    new Text('Mobile banking',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
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
                    Text("Bkash Payment",textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),

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
                    Container(alignment: Alignment.center,child: new Text('Support',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Support()),);
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
                    new Text('Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
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
                    new Text('Website',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
                  ],
                ),
                onTap: () async {
                    const url = 'https://circlenetworkbd.net/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },

              ),
            ),
          ),

        ],
      ),
    );
    var h=MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    if (MediaQuery.of(context).orientation == Orientation.portrait){
      // is portrait
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(preferredSize: Size.fromHeight(x/15),
            child: appBar_protrat),
        drawer: SafeArea(child: mainDrawer()),
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
              height: size.height-(size.height/15+appBar_protrat.preferredSize.height
                  +MediaQuery.of(context).padding.top),
              width: size.width,
              child: Container(
                child: SafeArea(
                  child: Container(
                    child: ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.30,
                          child: Image.asset(
                            'assets/images/cn4.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // textSection,
                        Container(
                          //padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          height: MediaQuery.of(context).size.height-(MediaQuery.of(context).
                          size.height*.3+appBar_landscope.preferredSize.height+appBar_landscope.
                          preferredSize.height+MediaQuery.of(context).padding.bottom+MediaQuery.of(context).padding.top+20),
                          child: gridSection,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }else{

      setState(() {
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      });
      return Scaffold(

        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),
            child: appBar_landscope),
        drawer: SafeArea(child: mainDrawer()),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Color(0xffFF7F50),
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
              height: size.height-(size.height/9+size.height/9),
              width: size.width,
              child: Container(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:  EdgeInsets.all(8),
                              child: Container(
                                child: Image.asset(
                                  'assets/images/cn4.png',
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height-(appBar_protrat.preferredSize.height+
                                      appBar_protrat.preferredSize.height+MediaQuery.of(context).padding.top),
                                  width: MediaQuery.of(context).size.width*.4,
                                ),
                                // child: Text("Testing"),
                              ),
                            ),
                          ),

                          // Container(
                          //
                          //
                          //   child:  Expanded(
                          //     child: GridView.count(
                          //         scrollDirection: Axis.vertical,
                          //         shrinkWrap: true,
                          //         crossAxisCount: 4,
                          //         childAspectRatio: (1 / 1),
                          //         controller: new ScrollController(keepScrollOffset: false),
                          //
                          //
                          //       children: [
                          //
                          //
                          //
                          //       ]
                          //     ),
                          //   ),
                          //   ),
                          Expanded(
                            flex: 2,
                            child: GridView.count(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: 4,
                              childAspectRatio: (1 / 1.2),
                              controller: new ScrollController(keepScrollOffset: false),
                             children: [
                               new Container(
                              //height: MediaQuery.of(context).size.height,
                              child: new InkResponse(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.asset(
                                        'assets/images/livetv.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                      new Text('Live Tv',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20)),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTv1()),);
                                },
                              ),
                            ),
                              new Container(
                                child: new InkResponse(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: new Column(
                                      children: <Widget>[
                                        new Image.asset(
                                          'assets/images/ftp.png', height: MediaQuery.of(context).size.height/8,
                                          width: 100,),
                                        new Text('FTP Server',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FTV()));
                                  },
                                ),
                              ),
                              new Container(
                                child: new InkResponse(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: new Column(
                                      children: <Widget>[
                                        new Image.asset(
                                          'assets/images/movie.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                        // new SizedBox(height: 3,),
                                        new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20)),

                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SamplePlayer()));
                                  },
                                ),
                              ),
                              new Container(
                                child: InkResponse(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      children: [
                                        new Image.asset(
                                          'assets/images/pack.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                        new SizedBox(height: 3,),
                                        new Text('Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                                  },
                                ),
                              ),
                              new Container(
                                child: InkResponse(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: new Image.asset(
                                          'assets/images/bksh.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                      ),
                                      new SizedBox(height: 3,),
                                      Text("Bkash Payment",textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => bkashPayment()));
                                  },
                                ),
                              ),
                              new Container(
                                child: InkResponse(
                                  child: Column(
                                    children: [
                                      new Image.asset(
                                        'assets/images/cash.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                      new SizedBox(height: 3,),
                                      new Text('Cash Payment', textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment()),);
                                  },
                                ),
                              ),
                              new Container(
                                child: InkResponse(
                                  child: Column(
                                    children: [
                                      new Image.asset(
                                        'assets/images/help.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                      new SizedBox(height: 3,),
                                      Container(alignment: Alignment.center,child: new Text('Support',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),)),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Support()),);
                                  },
                                ),
                              ),
                              new Container(
                                child: InkResponse(
                                  child: Column(
                                    children: [
                                      new Image.asset(
                                        'assets/images/partner.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                      new SizedBox(height: 3,),
                                      new Text('Website',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                                    ],
                                  ),
                                  onTap: () async {
                                    const url = 'https://circlenetworkbd.net/';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },

                                ),
                              ),
                            ],
                            )

                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

  }
}
