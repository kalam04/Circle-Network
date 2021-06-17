import 'dart:convert';
import 'dart:ui';

import 'package:circle_network/contact.dart';
import 'package:circle_network/ftv.dart';
import 'package:circle_network/movies.dart';
import 'package:circle_network/support.dart';
import 'package:circle_network/website.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bkashPayment.dart';
import 'cashPayment.dart';
import 'mainDrawer.dart';
import 'livetv.dart';
import 'mobileBanking.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package.dart';
import 'package:http/http.dart'as http;

var fullList1=[];

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
  var data_address;

  Future getvalueAdress()async{
    var response= await http.get(Uri.parse("http://circleapp-backend.herokuapp.com/office-address?"));
    setState(() {
      var decode=json.decode(response.body);
      data_address=decode;
      //print(widget.a);
      //debugPrint('x=$x');

    });
  }



  @override
  void dispose() {
    //print("work");
    // TODO: implement dispose
    super.dispose();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.getvalue();
    this._deleteAppDir();
    this._deleteCacheDir();
    this.getvalueAdress();

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
        crossAxisCount: 2,
        childAspectRatio: 1/.6,
        children: <Widget>[
          new Container(
            //height: MediaQuery.of(context).size.height,
            child: new Card(

              color: Colors.yellowAccent[100],
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
          // new Container(
          //   child: new Card(
          //       elevation: 0,
          //       color: Colors.transparent,
          //       child: new InkResponse(
          //         child: new Column(
          //           children: <Widget>[
          //             new Image.asset(
          //               'assets/images/ftp.png', height: MediaQuery.of(context).size.height/12,
          //               width: 100,),
          //             new SizedBox(height: 3,),
          //             new Text('FTP Server',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
          //
          //           ],
          //         ),
          //         onTap: () {
          //           Navigator.push(context, MaterialPageRoute(builder: (context)=>FTV()));
          //         },
          //       )
          //   ),
          // ),
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
          // new Container(
          //   child: new Card(
          //     elevation: 0,
          //     color: Colors.transparent,
          //     child: InkResponse(
          //       child: Column(
          //         children: [
          //           new Image.asset(
          //             'assets/images/mb.png', height: MediaQuery.of(context).size.height/12, width: 100,),
          //           new SizedBox(height: 3,),
          //           new Text('Mobile banking',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
          //         ],
          //       ),
          //       onTap: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) => MobileBanking()),);
          //       },
          //     ),
          //   ),
          // ),
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
          // new Container(
          //   child: new Card(
          //     elevation: 0,
          //     color: Colors.transparent,
          //     child: InkResponse(
          //       child: Column(
          //         children: [
          //           new Image.asset(
          //             'assets/images/partner.png', height: MediaQuery.of(context).size.height/11, width: 100,),
          //           new SizedBox(height: 3,),
          //           new Text('Website',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
          //         ],
          //       ),
          //       onTap: () async {
          //           const url = 'https://circlenetworkbd.net/';
          //           if (await canLaunch(url)) {
          //             await launch(url);
          //           } else {
          //             throw 'Could not launch $url';
          //           }
          //         },
          //
          //     ),
          //   ),
          // ),

        ],
      ),
    );
    var h=MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    var a=MediaQuery.of(context).size.height-(MediaQuery.of(context).
    size.height*.25+appBar_landscope.preferredSize.height+appBar_landscope.
    preferredSize.height+MediaQuery.of(context).padding.bottom+MediaQuery.of(context).padding.top);




    if (MediaQuery.of(context).orientation == Orientation.landscape){

      setState(() {
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      });
      var c=size.height-(size.height/9+size.height/9);
      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
        child: Scaffold(

          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),
              child: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                leading: Builder(
                  builder: (context) => InkWell(
                    onTap: (){
                      Scaffold.of(context).openDrawer();
                    },
                    child: Image.asset("assets/images/drawar.png"),),
                ),

                title: Text('Circle Network',style: TextStyle(fontSize: w/30,color: Colors.black),),
                backgroundColor: Color(0xffF8F3ED),
                centerTitle: true,
                leadingWidth: 30,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset("assets/images/cn.png"),
                  )
                ],

              )),
          drawer: SafeArea(child: mainDrawer()),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Color(0xffF8F3ED),
                  width: size.width,
                  height: size.height/9,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [

                      Container(
                        width: size.width,
                        height: size.height/9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(

                              disabledColor: Colors.transparent,

                              child: IconButton(
                                icon: Icon(
                                  Icons.home,
                                  color: currentIndex == 0
                                      ? Colors.black
                                      : Colors.grey[400],
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
                              disabledColor: Colors.transparent,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.call,
                                    color: currentIndex == 1
                                        ? Colors.orange
                                        : Colors.grey[400],
                                  ),
                                  onPressed: () {
                                    launch("tel:+09611800900");
                                  }),
                            ),
                            // Container(
                            //   width: size.width * 0.20,
                            // ),
                            RaisedButton(
                              disabledColor: Colors.transparent,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.camera,
                                    color: currentIndex == 2
                                        ? Colors.orange
                                        : Colors.grey[400],
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                                  }),
                            ),
                            RaisedButton(
                              disabledColor: Colors.transparent,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.payment,
                                    color: currentIndex == 3
                                        ? Colors.orange
                                        : Colors.grey[400],
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
                    child: SingleChildScrollView(
                      child: Container(
                        height: size.height-(size.height/9+size.height/9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 2,

                              child: Container(

                                child: Image.asset(
                                  'assets/images/cn4.png',
                                  fit: BoxFit.fill,
                                  height: size.width/10,
                                  width: size.width/10,

                                ),
                                // child: Text("Testing"),
                              ),
                            ),

                            Expanded(
                              flex: 3,



                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [

                                      new Container(
                                        height: c/2.2,
                                        width: c/2.2,
                                        padding: EdgeInsets.all(5),
                                        child: RaisedButton(
                                          color: Colors.orange[100],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.orange[100])),
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTv1()),);
                                          },
                                          child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              // new Image.asset(
                                              //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                              ClipOval(

                                                  child: Material(
                                                      color: Colors.white,
                                                      child: SizedBox(
                                                          height: size.width/16,
                                                          width: size.width/16,
                                                          child: Icon(Icons.live_tv_outlined,size: size.width/24,color: Color(0xfff9d494),)))),
                                              new SizedBox(height: 3,),
                                              new Text('Live Tv',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/35,color: Colors.white,)),
                                            ],
                                          ),
                                        ),
                                      ),

                                      new Container(
                                        height: c/2.2,
                                        width: c/2.2,
                                        padding: EdgeInsets.all(5),

                                        child: RaisedButton(
                                          color: Colors.blueAccent[100],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.blueAccent[100])),
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => SamplePlayer()),);
                                          },
                                          child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              // new Image.asset(
                                              //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                              ClipOval(

                                                  child: Material(

                                                      color: Colors.white,
                                                      child: SizedBox(
                                                          height: size.width/16,
                                                          width: size.width/16,
                                                          child: Icon(Icons.movie,size: size.width/22,color: Color(0xff7FBEF6),)))),
                                              new SizedBox(height: 3,),
                                              new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/35,color: Colors.white,)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      new Container(
                                        height: c/2.2,
                                        width:c/2.2,
                                        padding: EdgeInsets.all(5),
                                        child: RaisedButton(
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment()),);
                                          },
                                          color: Colors.deepPurpleAccent[100],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.deepPurpleAccent[100])),
                                          child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              // new Image.asset(
                                              //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                              ClipOval(

                                                  child: Material(

                                                      color: Colors.white,
                                                      child: SizedBox(
                                                          height: size.width/16,
                                                          width: size.width/16,
                                                          child: Icon(Icons.monetization_on_outlined,size: size.width/24,color: Color(0xffBBAAFA),)))),
                                              new SizedBox(height: 3,),
                                              new Text('Cash',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/35,color: Colors.white,)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      new Container(
                                        height: c/2.2,
                                        width: c/2.2,
                                        padding: EdgeInsets.all(5),
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.pink[200])),
                                          color: Colors.pink[200],
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => bkashPayment()));
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ClipOval(

                                                  child: Material(

                                                      color: Colors.white,
                                                      child: CircleAvatar(
                                                          radius: size.width/30,
                                                          backgroundColor: Colors.pink[50],
                                                          child: Image.asset("assets/images/bksh.png",width: size.width/24,height: size.width/24,)))),


                                              new SizedBox(height: 3,),
                                              Text("Bkash",textAlign: TextAlign.center,style: TextStyle(fontSize: wi/35,color: Colors.white,),),

                                            ],
                                          ),
                                        ),
                                      ),
                                      new Container(
                                        height: c/2.2,
                                        width: c/2.2,
                                        padding: EdgeInsets.all(5),
                                        child: RaisedButton(
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Support()),);
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.tealAccent[200],)),
                                          color: Colors.tealAccent[200],
                                          child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              // new Image.asset(
                                              //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                              ClipOval(

                                                  child: Material(

                                                      color: Colors.white,
                                                      child: SizedBox(
                                                          height: size.width/16,
                                                          width: size.width/16,
                                                          child: Icon(Icons.support_agent_sharp,size: size.width/24,color: Color(0xff79C8AD),)))),
                                              new SizedBox(height: 3,),
                                              new Text('Support',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/35,color: Colors.white,)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      new Container(
                                        height: c/2.2,
                                        width: c/2.2,
                                        padding: EdgeInsets.all(5),
                                        child: RaisedButton(
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Packages()),);
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.deepOrangeAccent[100])),
                                          color: Colors.deepOrangeAccent[100],
                                          child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              // new Image.asset(
                                              //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                              ClipOval(

                                                  child: Material(

                                                      color: Colors.white,
                                                      child: SizedBox(
                                                          height: size.width/16,
                                                          width: size.width/16,
                                                          child: Icon(Icons.camera,size: size.width/24,color: Color(0xffFE937B),)))),
                                              new SizedBox(height: 3,),
                                              new Text('Packages',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/40,color: Colors.white,)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],),


                                ],
                              ),

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
        ),
      );
    }else{
      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
        child: Scaffold(
          backgroundColor: Color(0xffF8F3ED),
          appBar:PreferredSize(
            preferredSize: Size.fromHeight(size.height/14),
            child: AppBar(
              iconTheme: IconThemeData(
                  color: Colors.yellow //change your color here
              ),
              title: Text('Circle Network',style: TextStyle(fontSize: x/30,color: Colors.black),),
              backgroundColor: Color(0xffF8F3ED),

              leadingWidth: 30,
              leading: Builder(
                builder: (context) => InkWell(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset("assets/images/drawar.png",height: size.height/13,),),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Image.asset("assets/images/cn.png"),
                )
              ],

            ),
          ),
          drawer: SafeArea(child: mainDrawer()),
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                height: size.height-(size.height/14+size.height/14  +MediaQuery.of(context).padding.top),
                width: size.width,

                child: CustomScrollView(

                  slivers: <Widget>[
                    SliverAppBar(
                      iconTheme: IconThemeData(
                          color: Colors.black //change your color here
                      ),

                      leadingWidth: 30,

                      backgroundColor: Color(0xffF8F3ED),

                      expandedHeight: 200.0,
                      // title: Text("Circle Network"),
                      // floating: true,
                      stretch: true,

                      // floating: true,
                      // pinned: true,

                      automaticallyImplyLeading: false,


                      flexibleSpace: FlexibleSpaceBar(

                          background: Stack(
                            children: [
                              Image.asset("assets/images/cn4.png",width: size.width,fit: BoxFit.cover,),

                            ],
                          )),
                    ),

                    SliverList(



                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(height: 10,),
                          // textSection,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              new Container(
                                height: size.width/2,
                                width: size.width/2,
                                child: new Card(
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  //shadowColor: Colors.tealAccent,

                                  color: Colors.orange[100],
                                  borderOnForeground: false,
                                  child: new InkResponse(
                                    child: new Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                // color: Colors.purple[100],
                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                              ),
                                              height: size.width/5,
                                              width: size.width/5,

                                              child: Image.asset("assets/images/livetvnew.png")),
                                        ),

                                        new SizedBox(height: 3,),
                                        new Text('Live Tv',textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: wi/15,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTv1()),);
                                    },
                                  ),
                                ),
                              ),

                              new Container(
                                height: size.width/2,
                                width: size.width/2,
                                child: new Card(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  color: Colors.blueAccent[100],
                                  child: new InkResponse(
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // new Image.asset(
                                        //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                        ClipOval(

                                            child: Material(

                                                color: Colors.white,
                                                child: SizedBox(
                                                    height: size.width/8,
                                                    width: size.width/8,
                                                    child: Icon(Icons.movie,size: size.width/12,color: Color(0xff7FBEF6),)))),
                                        new SizedBox(height: 3,),
                                        new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SamplePlayer()),);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              new Container(
                                height: size.width/2,
                                width: size.width/2,
                                child: new Card(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  color: Colors.deepPurpleAccent[100],
                                  child: new InkResponse(
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // new Image.asset(
                                        //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                        ClipOval(

                                            child: Material(

                                                color: Colors.white,
                                                child: SizedBox(
                                                    height: size.width/8,
                                                    width: size.width/8,
                                                    child: Icon(Icons.monetization_on_outlined,size: size.width/12,color: Color(0xffBBAAFA),)))),
                                        new SizedBox(height: 3,),
                                        new Text('Cash',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment()),);
                                    },
                                  ),
                                ),
                              ),

                              new Container(

                                height: size.width/2,
                                width: size.width/2,
                                child: new Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.pink[200],
                                  child: InkResponse(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipOval(

                                            child: Material(

                                                color: Colors.white,
                                                child: CircleAvatar(
                                                    radius: size.width/15,
                                                    backgroundColor: Colors.pink[50],
                                                    child: Image.asset("assets/images/bksh.png",width: size.width/12,height: size.width/12,)))),


                                        new SizedBox(height: 3,),
                                        Text("Bkash",textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,),),

                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => bkashPayment()));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              new Container(
                                height: size.width/2,
                                width: size.width/2,
                                child: new Card(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  color: Colors.tealAccent[200],
                                  child: new InkResponse(
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // new Image.asset(
                                        //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                        ClipOval(

                                            child: Material(

                                                color: Colors.white,
                                                child: SizedBox(
                                                    height: size.width/8,
                                                    width: size.width/8,
                                                    child: Icon(Icons.support_agent_sharp,size: size.width/12,color: Color(0xff79C8AD),)))),
                                        new SizedBox(height: 3,),
                                        new Text('Support',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Support()),);
                                    },
                                  ),
                                ),
                              ),
                              new Container(
                                height: size.width/2,
                                width: size.width/2,
                                child: new Card(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  color: Colors.deepOrangeAccent[100],
                                  child: new InkResponse(
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // new Image.asset(
                                        //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
                                        ClipOval(

                                            child: Material(

                                                color: Colors.white,
                                                child: SizedBox(
                                                    height: size.width/8,
                                                    width: size.width/8,
                                                    child: Icon(Icons.camera,size: size.width/12,color: Color(0xffFE937B),)))),
                                        new SizedBox(height: 3,),
                                        new Text('Packages',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Packages()),);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: size.width,
                height: size.height/14,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff45288D),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),)
                    ),
                    child: Column(
                      children: [

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),)
                          ),

                          width: size.width,
                          height: size.height/14,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [

                              Container(
                                width: size.width,
                                height: size.height/14,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.home,
                                        color: currentIndex == 0
                                            ? Color(0xff45298F)
                                            : Colors.grey[200],
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
                                              : Colors.grey[400],
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
                                              : Colors.grey[400],
                                        ),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                                        }),
                                    IconButton(
                                        icon: Icon(
                                          Icons.payment,
                                          color: currentIndex == 3
                                              ? Colors.orange
                                              : Colors.grey[400],
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),


        ),
      );
    }
  }
}
