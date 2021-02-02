import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_network/mainDrawer.dart';
import 'package:circle_network/offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'bkashPayment.dart';
import 'home.dart';

//import 'main.dart';

class Packages extends StatefulWidget {



  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {





  // Future getvalue()async{
  //   var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
  //   setState(() {
  //     var decode=json.decode(response.body);
  //     data=decode;
  //    //print(widget.a);
  //     //debugPrint('x=$x');
  //
  // });
  // }
  // var data;
  //
  // Future getvalue()async{
  //   var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
  //   setState(() {
  //     var decode=json.decode(response.body);
  //      data=decode;
  //     //print(widget.a);
  //     //debugPrint('x=$x');
  //
  //   });
  // }

  var pack_name=["Premium","Silver","Gold","Diamond","Platinum","Corporate-I","Corporate-II","Corporate-III","VIP-I","VIP-III",];
  var pack_mbps=["10","15","20","25","30","35","40","45","50","55",];
  var pack_tk=["800","1000","1200","1500","2000","2500","3000","3500","4000","4500",];

  TextEditingController _name,_mobile,_address;
  bool _validate = false;

  var data;

  Future getvalue()async{
    var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
    setState(() {
      var decode=json.decode(response.body);
      data=decode;
      //print(a);
      //debugPrint('x=$x');

    });
  }

  int currentIndex = 2;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = new TextEditingController();
    _mobile = new TextEditingController();
    _address = new TextEditingController();
    this.getvalue();
    //this.getvalue();


  }





  @override
  Widget build(BuildContext context) {
    var a=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    AppBar appBar_Protrait=AppBar(
      title: Center(child: Text('Packages',style: TextStyle(fontSize: x/30),)),
      backgroundColor: Colors.lightGreen[400],
      centerTitle: true,
      leadingWidth: 0,
    );
    AppBar appBar_Landscope=AppBar(
      title: Center(child: Text('Packages',style: TextStyle(fontSize: a/30),)),
      backgroundColor: Colors.lightGreen[400],
      centerTitle: true,
      leadingWidth: 0,
    );

    if(MediaQuery.of(context).orientation==Orientation.portrait){
      if(data==null||data.length==0){
        // print("work");
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(x/15),child: appBar_Protrait),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.lightGreen[400],
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
                height: size.height-(size.height/15+size.height/15
                    +MediaQuery.of(context).padding.top),
                width: size.width,
                child: Container(
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.topRight,
                  //         end: Alignment.bottomLeft,
                  //         colors: [
                  //           Color(0xffc0c0c0),
                  //           Color(0xffFFFEDC),
                  //           //Color(0xffFFA500)
                  //         ])),
                  color: Colors.transparent,
                  child: Container(
                    child: ListView.builder(

                        itemCount: pack_name.length,
                        itemBuilder: (context, index){
                          return
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(-3, -3),
                                          color: Color(0xffA2CAEF).withOpacity(0.2),
                                          spreadRadius: 6,
                                          blurRadius: 6)
                                    ],
                                    borderRadius: BorderRadius.circular(15),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(pack_name[index], style: TextStyle(
                                            color: Colors.purple[900],
                                            fontSize: a/10,
                                            fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        children: [
                                          Text(pack_mbps[index], style: TextStyle(
                                              color: Colors.purple[900],
                                              fontWeight: FontWeight.bold,fontSize: a/4.toDouble()),

                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Container(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text("Mbps", style: TextStyle(
                                                      color: Colors.black,

                                                      fontWeight: FontWeight.bold,fontSize: a/11),

                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Unlimited ", style: TextStyle(
                                                      color: Colors.grey,

                                                      fontWeight: FontWeight.bold,fontSize: a/16),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0),

                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    //   child: Container(
                                    //     height: 2,
                                    //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                                    //   ),
                                    // ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(pack_tk[index]+" TK/month", style: TextStyle(
                                        fontSize: a/14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        //decoration: TextDecoration.lineThrough
                                      ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          // showDialog(context: context,builder: (dialogContex){
                                          //   return AlertDialog(
                                          //       shape: RoundedRectangleBorder(
                                          //             borderRadius: BorderRadius.circular(16)
                                          //         ),
                                          //         elevation: 0,
                                          //         title: new Text("Your Information",textAlign: TextAlign.center,),
                                          //
                                          //     content: Container(
                                          //
                                          //       width: double.maxFinite,
                                          //       child: new ListView(
                                          //         shrinkWrap: true,
                                          //         // height: 350,
                                          //         children: <Widget>[
                                          //           Padding(
                                          //             padding: const EdgeInsets.all(8.0),
                                          //             child: new TextField(
                                          //               decoration: InputDecoration(
                                          //                 labelText: 'Name',
                                          //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          //               ),
                                          //               controller: _name,
                                          //
                                          //             ),
                                          //           ),
                                          //           Padding(
                                          //             padding: const EdgeInsets.all(8.0),
                                          //             child: new TextField(
                                          //               keyboardType: TextInputType.phone,
                                          //               decoration: InputDecoration(
                                          //                 labelText: 'Mobile NO',
                                          //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          //               ),
                                          //               controller: _mobile,
                                          //
                                          //             ),
                                          //           ),
                                          //           Padding(
                                          //             padding: const EdgeInsets.all(8.0),
                                          //             child: new TextField(
                                          //               decoration: InputDecoration(
                                          //                 labelText: 'Address',
                                          //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          //               ),
                                          //               controller: _address,
                                          //               maxLines: 3,
                                          //
                                          //             ),
                                          //           ),
                                          //           // new FlatButton(
                                          //           //   child: new Text("Submit"),
                                          //           //   onPressed: (){
                                          //           //
                                          //           //     Navigator.pop(dialogContex);
                                          //           //   },
                                          //           // )
                                          //         ],
                                          //       ),
                                          //
                                          //     ),
                                          //     actions: <Widget>[
                                          //       new FlatButton(
                                          //           child: const Text('CANCEL'),
                                          //           onPressed: () {
                                          //             Navigator.pop(dialogContex);
                                          //           }),
                                          //       new FlatButton(
                                          //           child: const Text('Submit'),
                                          //           onPressed: () {
                                          //             if(_name.text.isEmpty){
                                          //               final snackBar = SnackBar(
                                          //                 content: Text('Please Enter name '),
                                          //                 action: SnackBarAction(
                                          //                   label: 'Undo',
                                          //                 ),
                                          //               );
                                          //               Scaffold.of(context).showSnackBar(snackBar);
                                          //             }else {
                                          //               Navigator.pop(dialogContex);
                                          //             }
                                          //
                                          //
                                          //
                                          //           })
                                          //     ],
                                          //
                                          //   );
                                          // });
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));

                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(-5, -3),
                                                    color: Colors.white.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 5)
                                              ],
                                              gradient: LinearGradient(
                                                  colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text(
                                            "Get Now",
                                            style: TextStyle(
                                                fontSize: a/22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    //   child: Container(
                                    //     height: 2,
                                    //     decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                                    //   ),
                                    // ),
                                  ],

                                ),
                              ),
                            );
                        }
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: mainDrawer(),
        );
      }else{
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(x/15),child: appBar_Protrait),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.lightGreen[400],
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
                height: size.height-(size.height/15+size.height/15
                    +MediaQuery.of(context).padding.top),
                width: size.width,
                child: Container(
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.topRight,
                  //         end: Alignment.bottomLeft,
                  //         colors: [
                  //           Color(0xffc0c0c0),
                  //           Color(0xffFFFEDC),
                  //           //Color(0xffFFA500)
                  //         ])),
                  color: Colors.transparent,
                  child: Container(
                    child: ListView.builder(

                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(-3, -3),
                                          color: Color(0xffA2CAEF).withOpacity(0.2),
                                          spreadRadius: 6,
                                          blurRadius: 6)
                                    ],
                                    borderRadius: BorderRadius.circular(15),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(data[index]["name"], style: TextStyle(
                                            color: Colors.purple[900],
                                            fontSize: a/10,
                                            fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        children: [
                                          Text(data[index]["band"].toString(), style: TextStyle(
                                              color: Colors.purple[900],
                                              fontWeight: FontWeight.bold,fontSize: a/4.toDouble()),

                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Container(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text("Mbps", style: TextStyle(
                                                      color: Colors.black,

                                                      fontWeight: FontWeight.bold,fontSize: a/11),

                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Unlimited ", style: TextStyle(
                                                      color: Colors.grey,

                                                      fontWeight: FontWeight.bold,fontSize: a/16),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0),

                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    //   child: Container(
                                    //     height: 2,
                                    //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                                    //   ),
                                    // ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(data[index]["price"].toString()+" TK/month", style: TextStyle(
                                        fontSize: a/14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        //decoration: TextDecoration.lineThrough
                                      ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          // showDialog(context: context,builder: (dialogContex){
                                          //   return AlertDialog(
                                          //       shape: RoundedRectangleBorder(
                                          //             borderRadius: BorderRadius.circular(16)
                                          //         ),
                                          //         elevation: 0,
                                          //         title: new Text("Your Information",textAlign: TextAlign.center,),
                                          //
                                          //     content: Container(
                                          //
                                          //       width: double.maxFinite,
                                          //       child: new ListView(
                                          //         shrinkWrap: true,
                                          //         // height: 350,
                                          //         children: <Widget>[
                                          //           Padding(
                                          //             padding: const EdgeInsets.all(8.0),
                                          //             child: new TextField(
                                          //               decoration: InputDecoration(
                                          //                 labelText: 'Name',
                                          //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          //               ),
                                          //               controller: _name,
                                          //
                                          //             ),
                                          //           ),
                                          //           Padding(
                                          //             padding: const EdgeInsets.all(8.0),
                                          //             child: new TextField(
                                          //               keyboardType: TextInputType.phone,
                                          //               decoration: InputDecoration(
                                          //                 labelText: 'Mobile NO',
                                          //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          //               ),
                                          //               controller: _mobile,
                                          //
                                          //             ),
                                          //           ),
                                          //           Padding(
                                          //             padding: const EdgeInsets.all(8.0),
                                          //             child: new TextField(
                                          //               decoration: InputDecoration(
                                          //                 labelText: 'Address',
                                          //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          //               ),
                                          //               controller: _address,
                                          //               maxLines: 3,
                                          //
                                          //             ),
                                          //           ),
                                          //           // new FlatButton(
                                          //           //   child: new Text("Submit"),
                                          //           //   onPressed: (){
                                          //           //
                                          //           //     Navigator.pop(dialogContex);
                                          //           //   },
                                          //           // )
                                          //         ],
                                          //       ),
                                          //
                                          //     ),
                                          //     actions: <Widget>[
                                          //       new FlatButton(
                                          //           child: const Text('CANCEL'),
                                          //           onPressed: () {
                                          //             Navigator.pop(dialogContex);
                                          //           }),
                                          //       new FlatButton(
                                          //           child: const Text('Submit'),
                                          //           onPressed: () {
                                          //             if(_name.text.isEmpty){
                                          //               final snackBar = SnackBar(
                                          //                 content: Text('Please Enter name '),
                                          //                 action: SnackBarAction(
                                          //                   label: 'Undo',
                                          //                 ),
                                          //               );
                                          //               Scaffold.of(context).showSnackBar(snackBar);
                                          //             }else {
                                          //               Navigator.pop(dialogContex);
                                          //             }
                                          //
                                          //
                                          //
                                          //           })
                                          //     ],
                                          //
                                          //   );
                                          // });
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));

                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(-5, -3),
                                                    color: Colors.white.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 5)
                                              ],
                                              gradient: LinearGradient(
                                                  colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text(
                                            "Get Now",
                                            style: TextStyle(
                                                fontSize: a/22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    //   child: Container(
                                    //     height: 2,
                                    //     decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                                    //   ),
                                    // ),
                                  ],

                                ),
                              ),
                            );
                        }
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: mainDrawer(),
        );
      }
    }else{
      if(data==null||data.length==0){
        // print("work");
        setState(() {
          SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
        });
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),child: appBar_Landscope),
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
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.topRight,
                  //         end: Alignment.bottomLeft,
                  //         colors: [
                  //           Color(0xffc0c0c0),
                  //           Color(0xffFFFEDC),
                  //           //Color(0xffFFA500)
                  //         ])),
                  color: Colors.transparent,
                  child: Container(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,childAspectRatio: 1/.9),
                        itemCount: pack_name.length,
                        itemBuilder: (context, index){
                          return
                            Padding(
                              padding:  EdgeInsets.fromLTRB(30, 10,30.0,10.0),
                              child: Container(
                               // padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(-3, -3),
                                          color: Color(0xffA2CAEF).withOpacity(0.2),
                                          spreadRadius: 6,
                                          blurRadius: 6)
                                    ],
                                    borderRadius: BorderRadius.circular(15),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(pack_name[index], style: TextStyle(
                                            color: Colors.purple[900],
                                            fontSize: a/20,
                                            fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(pack_mbps[index], style: TextStyle(
                                            color: Colors.purple[900],
                                            fontWeight: FontWeight.bold,fontSize: a/8.toDouble()),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Text("Mbps", style: TextStyle(
                                                    color: Colors.black,

                                                    fontWeight: FontWeight.bold,fontSize: a/30),

                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text("Unlimited ", style: TextStyle(
                                                    color: Colors.grey,

                                                    fontWeight: FontWeight.bold,fontSize: a/35),

                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(pack_tk[index]+" TK/month", style: TextStyle(
                                        fontSize: a/35,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        //decoration: TextDecoration.lineThrough
                                      ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: (){
                                        // showDialog(context: context,builder: (dialogContex){
                                        //   return AlertDialog(
                                        //       shape: RoundedRectangleBorder(
                                        //             borderRadius: BorderRadius.circular(16)
                                        //         ),
                                        //         elevation: 0,
                                        //         title: new Text("Your Information",textAlign: TextAlign.center,),
                                        //
                                        //     content: Container(
                                        //
                                        //       width: double.maxFinite,
                                        //       child: new ListView(
                                        //         shrinkWrap: true,
                                        //         // height: 350,
                                        //         children: <Widget>[
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(8.0),
                                        //             child: new TextField(
                                        //               decoration: InputDecoration(
                                        //                 labelText: 'Name',
                                        //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                        //               ),
                                        //               controller: _name,
                                        //
                                        //             ),
                                        //           ),
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(8.0),
                                        //             child: new TextField(
                                        //               keyboardType: TextInputType.phone,
                                        //               decoration: InputDecoration(
                                        //                 labelText: 'Mobile NO',
                                        //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                        //               ),
                                        //               controller: _mobile,
                                        //
                                        //             ),
                                        //           ),
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(8.0),
                                        //             child: new TextField(
                                        //               decoration: InputDecoration(
                                        //                 labelText: 'Address',
                                        //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                        //               ),
                                        //               controller: _address,
                                        //               maxLines: 3,
                                        //
                                        //             ),
                                        //           ),
                                        //           // new FlatButton(
                                        //           //   child: new Text("Submit"),
                                        //           //   onPressed: (){
                                        //           //
                                        //           //     Navigator.pop(dialogContex);
                                        //           //   },
                                        //           // )
                                        //         ],
                                        //       ),
                                        //
                                        //     ),
                                        //     actions: <Widget>[
                                        //       new FlatButton(
                                        //           child: const Text('CANCEL'),
                                        //           onPressed: () {
                                        //             Navigator.pop(dialogContex);
                                        //           }),
                                        //       new FlatButton(
                                        //           child: const Text('Submit'),
                                        //           onPressed: () {
                                        //             if(_name.text.isEmpty){
                                        //               final snackBar = SnackBar(
                                        //                 content: Text('Please Enter name '),
                                        //                 action: SnackBarAction(
                                        //                   label: 'Undo',
                                        //                 ),
                                        //               );
                                        //               Scaffold.of(context).showSnackBar(snackBar);
                                        //             }else {
                                        //               Navigator.pop(dialogContex);
                                        //             }
                                        //
                                        //
                                        //
                                        //           })
                                        //     ],
                                        //
                                        //   );
                                        // });
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));

                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(-5, -3),
                                                  color: Colors.white.withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 5)
                                            ],
                                            gradient: LinearGradient(
                                                colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Text(
                                          "Get Now",
                                          style: TextStyle(
                                              fontSize: a/30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    //   child: Container(
                                    //     height: 2,
                                    //     decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                                    //   ),
                                    // ),
                                  ],

                                ),
                              ),
                            );
                        }
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: mainDrawer(),
        );
      }else{
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),child: appBar_Landscope),
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
                  color: Colors.transparent,
                  child: Container(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,childAspectRatio: 1/.9),
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 10.0,30.0,10.0),
                              child: Container(
                               // padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(-3, -3),
                                          color: Color(0xffA2CAEF).withOpacity(0.2),
                                          spreadRadius: 6,
                                          blurRadius: 6)
                                    ],
                                    borderRadius: BorderRadius.circular(15),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(data[index]["name"], style: TextStyle(
                                            color: Colors.purple[900],
                                            fontSize: a/20,
                                            fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(data[index]["band"].toString(), style: TextStyle(
                                            color: Colors.purple[900],
                                            fontWeight: FontWeight.bold,fontSize: a/8.toDouble()),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Text("Mbps", style: TextStyle(
                                                    color: Colors.black,

                                                    fontWeight: FontWeight.bold,fontSize: a/30),

                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text("Unlimited ", style: TextStyle(
                                                    color: Colors.grey,

                                                    fontWeight: FontWeight.bold,fontSize: a/35),

                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(data[index]["price"].toString()+" TK/month", style: TextStyle(
                                        fontSize: a/35,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        //decoration: TextDecoration.lineThrough
                                      ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(5.0),),

                                    InkWell(
                                      onTap: (){
                                        // showDialog(context: context,builder: (dialogContex){
                                        //   return AlertDialog(
                                        //       shape: RoundedRectangleBorder(
                                        //             borderRadius: BorderRadius.circular(16)
                                        //         ),
                                        //         elevation: 0,
                                        //         title: new Text("Your Information",textAlign: TextAlign.center,),
                                        //
                                        //     content: Container(
                                        //
                                        //       width: double.maxFinite,
                                        //       child: new ListView(
                                        //         shrinkWrap: true,
                                        //         // height: 350,
                                        //         children: <Widget>[
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(8.0),
                                        //             child: new TextField(
                                        //               decoration: InputDecoration(
                                        //                 labelText: 'Name',
                                        //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                        //               ),
                                        //               controller: _name,
                                        //
                                        //             ),
                                        //           ),
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(8.0),
                                        //             child: new TextField(
                                        //               keyboardType: TextInputType.phone,
                                        //               decoration: InputDecoration(
                                        //                 labelText: 'Mobile NO',
                                        //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                        //               ),
                                        //               controller: _mobile,
                                        //
                                        //             ),
                                        //           ),
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(8.0),
                                        //             child: new TextField(
                                        //               decoration: InputDecoration(
                                        //                 labelText: 'Address',
                                        //                 errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                        //               ),
                                        //               controller: _address,
                                        //               maxLines: 3,
                                        //
                                        //             ),
                                        //           ),
                                        //           // new FlatButton(
                                        //           //   child: new Text("Submit"),
                                        //           //   onPressed: (){
                                        //           //
                                        //           //     Navigator.pop(dialogContex);
                                        //           //   },
                                        //           // )
                                        //         ],
                                        //       ),
                                        //
                                        //     ),
                                        //     actions: <Widget>[
                                        //       new FlatButton(
                                        //           child: const Text('CANCEL'),
                                        //           onPressed: () {
                                        //             Navigator.pop(dialogContex);
                                        //           }),
                                        //       new FlatButton(
                                        //           child: const Text('Submit'),
                                        //           onPressed: () {
                                        //             if(_name.text.isEmpty){
                                        //               final snackBar = SnackBar(
                                        //                 content: Text('Please Enter name '),
                                        //                 action: SnackBarAction(
                                        //                   label: 'Undo',
                                        //                 ),
                                        //               );
                                        //               Scaffold.of(context).showSnackBar(snackBar);
                                        //             }else {
                                        //               Navigator.pop(dialogContex);
                                        //             }
                                        //
                                        //
                                        //
                                        //           })
                                        //     ],
                                        //
                                        //   );
                                        // });
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));

                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(-5, -3),
                                                  color: Colors.white.withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 5)
                                            ],
                                            gradient: LinearGradient(
                                                colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Text(
                                          "Get Now",
                                          style: TextStyle(
                                              fontSize: a/30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    //   child: Container(
                                    //     height: 2,
                                    //     decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                                    //   ),
                                    // ),
                                  ],

                                ),
                              ),
                            );
                        }
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



  }
}





