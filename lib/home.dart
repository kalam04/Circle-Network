import 'dart:convert';

import 'package:circle_network/contact.dart';
import 'package:circle_network/ftv.dart';
import 'package:circle_network/movies.dart';
import 'package:circle_network/support.dart';
import 'package:circle_network/website.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.getvalue();
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;


    Color color = Theme
        .of(context)
        .popupMenuTheme.color;

    AppBar appBar_protrat=AppBar(
      title: Center(child: Text('Circle Network       ',style: TextStyle(fontSize: x/30),)),
      backgroundColor: Color(0xffFF7F50),
      centerTitle: true,
    );
    AppBar appBar_landscope=AppBar(
      title: Center(child: Text('Circle Network       ',style: TextStyle(fontSize: w/30),)),
      backgroundColor: Color(0xffFF7F50),
      centerTitle: true,

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
                    new Text('Live Tv',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20)),
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
                      new Text('FTP Server',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20),),

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
                    new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20)),

                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Movies()));
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
                    new Text('Cash Payment', textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20),),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment(data_address: widget.address,)),);
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
                    new Text('Mobile banking',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20),),
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
                    Text("Bkash Payment",textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20),),

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
                    Container(alignment: Alignment.center,child: new Text('Support',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20),)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Support(data_address: widget.address)),);
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
                    new Text('Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20),),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages(data: widget.data,)));
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
                    new Text('Website',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/20),),
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

    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
    if (MediaQuery.of(context).orientation == Orientation.portrait){
      // is portrait
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),
            child: appBar_protrat),
        drawer: SafeArea(child: mainDrawer()),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: [
                Container(

                  child: Image.asset(
                    'assets/images/cn4.png',
                    fit: BoxFit.cover,height: MediaQuery.of(context).size.height*.30,
                  ),
                ),
                // textSection,
                Container(
                  //padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  height: MediaQuery.of(context).size.height-(MediaQuery.of(context).
                  size.height*.3+appBar_landscope.preferredSize.height+appBar_landscope.preferredSize.height-MediaQuery.of(context).padding.bottom),
                  child: gridSection,

                )
              ],
            ),
          ),
        ),
      );
    }else{
// is landscape
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(preferredSize: Size.fromHeight(w/14),
            child: appBar_landscope),
        drawer: mainDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8),
                    child: Container(
                      child: Image.asset(
                        'assets/images/cn4.png',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height-160,
                        width: MediaQuery.of(context).size.width*.4,
                      ),
                      // child: Text("Testing"),
                    ),
                  ),

                  // textSection,
                  Container(
                    height: MediaQuery.of(context).size.height-(MediaQuery.of(context).
                    size.height*.3+appBar_landscope.preferredSize.height+appBar_landscope.preferredSize.height-MediaQuery.of(context).padding.bottom),
                    child:  new Expanded(
                      child: GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this would produce 2 rows.
                        crossAxisCount: 4,
                        // Generate 100 Widgets that display their index in the List
                        children: [
                          new Container(
                            //height: MediaQuery.of(context).size.height,
                            child: new InkResponse(
                              child: new Column(
                                children: <Widget>[
                                  new Image.asset(
                                    'assets/images/livetv.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                  new Text('Live Tv',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20)),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTv1()),);
                              },
                            ),
                          ),
                          new Container(
                            child: new InkResponse(
                              child: new Column(
                                children: <Widget>[
                                  new Image.asset(
                                    'assets/images/ftp.png', height: MediaQuery.of(context).size.height/8,
                                    width: 100,),
                                  new Text('FTP Server',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FTV()));
                              },
                            ),
                          ),
                          new Container(
                            child: new InkResponse(
                              child: new Column(
                                children: <Widget>[
                                  new Image.asset(
                                    'assets/images/movie.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                  new SizedBox(height: 3,),
                                  new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20)),

                                ],
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Movies()));
                              },
                            ),
                          ),
                          new Container(
                            child: InkResponse(
                              child: Column(
                                children: [
                                  new Image.asset(
                                    'assets/images/pack.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                                  new SizedBox(height: 3,),
                                  new Text('Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages(data: widget.data,)));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment(data_address: widget.address,)),);
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Support(data_address: widget.address)),);
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


                        ]
                      ),
                    ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );


    }

  }
}
