import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_network/mainDrawer.dart';
import 'package:circle_network/offer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'main.dart';

class Packages extends StatefulWidget {
  var data;
  Packages({this.data});


  @override
  _PackagesState createState() => _PackagesState(data);
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

  _PackagesState(data);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = new TextEditingController();
    _mobile = new TextEditingController();
    _address = new TextEditingController();
    //this.getvalue();


  }





  @override
  Widget build(BuildContext context) {
    var a=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;

    AppBar appBar_Protrait=AppBar(
      title: Center(child: Text('Packages',style: TextStyle(fontSize: x/30),)),
      backgroundColor: Colors.lightGreen[400],
      centerTitle: true,
    );
    AppBar appBar_Landscope=AppBar(
      title: Center(child: Text('Packages',style: TextStyle(fontSize: a/30),)),
      backgroundColor: Colors.lightGreen[400],
      centerTitle: true,
    );

    if(MediaQuery.of(context).orientation==Orientation.portrait){
      if(widget.data==null||widget.data.length==0){
        // print("work");
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),child: appBar_Protrait),
          body: Container(
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
          drawer: mainDrawer(),
        );
      }else{
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),child: appBar_Protrait),
          body: Container(
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

                  itemCount: widget.data.length,
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
                                  child: Text(widget.data[index]["name"], style: TextStyle(
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
                                    Text(widget.data[index]["band"].toString(), style: TextStyle(
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
                                child: Text(widget.data[index]["price"].toString()+" TK/month", style: TextStyle(
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
          drawer: mainDrawer(),
        );
      }
    }else{
      if(widget.data==null||widget.data.length==0){
        // print("work");
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(a/16),child: appBar_Landscope),
          body: Container(
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
                        padding: const EdgeInsets.fromLTRB(120, 15.0,120.0,15.0),
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
                                      fontSize: a/20,
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
                                  fontSize: a/35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  //decoration: TextDecoration.lineThrough
                                ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5.0),
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
                                          fontSize: a/30,
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
          drawer: mainDrawer(),
        );
      }else{
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(a/16),child: appBar_Landscope),
          body: Container(
            color: Colors.transparent,
            child: Container(
              child: ListView.builder(

                  itemCount: widget.data.length,
                  itemBuilder: (context, index){
                    return
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 15.0,120.0,15.0),
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
                                  child: Text(widget.data[index]["name"], style: TextStyle(
                                      color: Colors.purple[900],
                                      fontSize: a/20,
                                      fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(widget.data[index]["band"].toString(), style: TextStyle(
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
                                child: Text(widget.data[index]["price"].toString()+" TK/month", style: TextStyle(
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
          drawer: mainDrawer(),
        );
      }
    }



  }
}





