import 'dart:convert';

import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;


class Contact extends StatefulWidget {
  var data_address;
  Contact({this.data_address});


  @override
  _ContactState createState() => _ContactState(data_address);
}

class _ContactState extends State<Contact> {
  _ContactState(data_address);

//   var data_address;
//
//   Future getvalueAdress()async{
//     var response= await http.get("http://circleapp-backend.herokuapp.com/office-address?");
//     setState(() {
//       var decode=json.decode(response.body);
//       data_address=decode;
//       //print(widget.a);
//       //debugPrint('x=$x');
//
//     });
//   }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     this.getvalueAdress();
//   }
  var office_Name=["Savar  Office","Uttara Office","Ishwardi Office","Motijheel Office ","Joydebpur Office","Rajbari Office"];
  var office_Address=["Unity trade Center 3rd Floor Pollibiddut Bus Stand Nabinagar,Ashulia, Savar,Dhaka-1344.",
    "Sonargaon janapath road, house-35, sector-7, Uttara.",
    "Ishwardi Sher shah road (Beltola)",
    "60/2 Purana Palton (Igloos Dream), 2nd Floor, Palton, Dhaka.",
        "Joydebpur Gazipur Habiullah sarni Road- Chandona A 131 ",
        "Rajbari Net Link ( R N L) Hirok mention 3rd floor"
  ];
  var office_Support=["01962444999","01962444999","01944455102","01777786567","01944455277","01944455111"];
  var office_Sales=["01944455012","01944455090","01944455102","01944455043","01944455277","01944455111"];


  @override
  Widget build(BuildContext context) {
    //print(widget.data_address.length);
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    if(MediaQuery.of(context).orientation==Orientation.portrait){
      if(widget.data_address==null || widget.data_address.length==0 ){
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),
              child: AppBar(title: Center(child: new Text("Contact",style: TextStyle(fontSize: x/30),)),centerTitle: true,)),
          body: Container(
            child: ListView.builder(itemCount: office_Name.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.all(w/20),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-3, -3),
                              color: Color(0xffEBEBEB),
                              spreadRadius: 6,
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.cyan[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(alignment: Alignment.center,child: Text(office_Name[index].toString(),
                            style: new TextStyle(fontFamily: 'Ubuntu-Regular', fontSize: w/12,
                              fontWeight: FontWeight.bold,color: Colors.deepPurple, ),textAlign: TextAlign.center,
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(office_Address[index].toString(), style: TextStyle(color: Colors.black, fontSize: w/20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Support : "+office_Support[index].toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: w/22,
                              ), textAlign: TextAlign.center
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),

                          ),

                          Container(
                            alignment: Alignment.center,
                            child: Text("Sales : "+office_Sales[index].toString(), style: TextStyle(
                              fontSize: w/22,
                              color: Colors.black,


                              //decoration: TextDecoration.lineThrough
                            ),textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: w/50),
                                  child: RaisedButton(child: Text("Call Support",style: TextStyle(fontSize: w/15)),onPressed: (){
                                    launch("tel:+88"+office_Support[index]);
                                  },shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)),
                                    color: Colors.white70,),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(right: w/50),
                                  child: RaisedButton(child: Text("Call Sales",style: TextStyle(fontSize: w/15),),onPressed: (){
                                    launch("tel:+88"+office_Sales[index]);
                                  },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.black)),
                                    color: Colors.white,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

            ),

          ),
          drawer: SafeArea(child: mainDrawer()),
        );

      }else{
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),
              child: AppBar(title: Center(child: new Text("Contact",style: TextStyle(fontSize: x/30),)),centerTitle: true,)),
          body: Container(
            child: ListView.builder(itemCount: widget.data_address.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-3, -3),
                              color: Color(0xffEBEBEB),
                              spreadRadius: 6,
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.cyan[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(alignment: Alignment.center,child: Text(widget.data_address[index]["office"].toString(),
                            style: new TextStyle(fontFamily: 'Ubuntu-Regular', fontSize: w/12,
                              fontWeight: FontWeight.bold,color: Colors.deepPurple, ),textAlign: TextAlign.center,
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(widget.data_address[index]["address"].toString(), style: TextStyle(color: Colors.black, fontSize: w/20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Support : "+widget.data_address[index]["support"].toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: w/22,
                              ), textAlign: TextAlign.center
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),

                          ),

                          Container(
                            alignment: Alignment.center,
                            child: Text("Sales : "+widget.data_address[index]["sales"].toString(), style: TextStyle(
                              fontSize: w/22,
                              color: Colors.black,


                              //decoration: TextDecoration.lineThrough
                            ),textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: w/40),
                                  child: RaisedButton(child: Text("Call Support",style: TextStyle(fontSize: w/25)),onPressed: (){
                                    launch("tel:"+widget.data_address[index]["support"]);
                                  },shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)),
                                    color: Colors.white70,),
                                ),
                                Padding(padding: EdgeInsets.only(left: w/70)),

                                Padding(
                                  padding:  EdgeInsets.only(right: w/40),
                                  child: RaisedButton(child: Text("Call Sales",style: TextStyle(fontSize: w/25),),onPressed: (){
                                    launch("tel:"+widget.data_address[index]["sales"]);
                                  },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.black)),
                                    color: Colors.white,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

            ),

          ),
          drawer: SafeArea(child: mainDrawer()),
        );
      }
    }else{
      if(widget.data_address==null || widget.data_address.length==0 ){
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(w/16),
              child: AppBar(title: Center(child: new Text("Contact",style: TextStyle(fontSize: w/30),)),centerTitle: true,)),
          body: Container(
            child: ListView.builder(itemCount: office_Name.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.fromLTRB(100,20,100,20),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-3, -3),
                              color: Color(0xffEBEBEB),
                              spreadRadius: 6,
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.cyan[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(alignment: Alignment.center,child: Text(office_Name[index].toString(),
                            style: new TextStyle(fontFamily: 'Ubuntu-Regular', fontSize: w/20,
                              fontWeight: FontWeight.bold,color: Colors.deepPurple, ),textAlign: TextAlign.center,
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(office_Address[index].toString(), style: TextStyle(color: Colors.black, fontSize: w/35),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Support : "+office_Support[index].toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: w/37,
                              ), textAlign: TextAlign.center
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),

                          ),

                          Container(
                            alignment: Alignment.center,
                            child: Text("Sales : "+office_Sales[index].toString(), style: TextStyle(
                              fontSize: w/37,
                              color: Colors.black,


                              //decoration: TextDecoration.lineThrough
                            ),textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: w/50),
                                  child: RaisedButton(child: Text("Call Support",style: TextStyle(fontSize: w/15)),onPressed: (){
                                    launch("tel:+88"+office_Support[index]);
                                  },shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)),
                                    color: Colors.white70,),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(right: w/50),
                                  child: RaisedButton(child: Text("Call Sales",style: TextStyle(fontSize: w/15),),onPressed: (){
                                    launch("tel:+88"+office_Sales[index]);
                                  },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.black)),
                                    color: Colors.white,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

            ),

          ),
          drawer: SafeArea(child: mainDrawer()),
        );

      }else{
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(w/16),
              child: AppBar(title: Center(child: new Text("Contact",style: TextStyle(fontSize: w/30),)),centerTitle: true,)),
          body: Container(
            child: ListView.builder(itemCount: widget.data_address.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(100,20.0,100,20),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-3, -3),
                              color: Color(0xffEBEBEB),
                              spreadRadius: 6,
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.cyan[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(alignment: Alignment.center,child: Text(widget.data_address[index]["office"].toString(),
                            style: new TextStyle(fontFamily: 'Ubuntu-Regular', fontSize: w/20,
                              fontWeight: FontWeight.bold,color: Colors.deepPurple, ),textAlign: TextAlign.center,
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(widget.data_address[index]["address"].toString(), style: TextStyle(color: Colors.black, fontSize: w/35),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Support : "+widget.data_address[index]["support"].toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: w/37,
                              ), textAlign: TextAlign.center
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),

                          ),

                          Container(
                            alignment: Alignment.center,
                            child: Text("Sales : "+widget.data_address[index]["sales"].toString(), style: TextStyle(
                              fontSize: w/37,
                              color: Colors.black,


                              //decoration: TextDecoration.lineThrough
                            ),textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: w/40),
                                  child: RaisedButton(child: Text("Call Support",style: TextStyle(fontSize: w/25)),onPressed: (){
                                    launch("tel:"+widget.data_address[index]["support"]);
                                  },shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)),
                                    color: Colors.white70,),
                                ),
                                Padding(padding: EdgeInsets.only(left: w/70)),

                                Padding(
                                  padding:  EdgeInsets.only(right: w/40),
                                  child: RaisedButton(child: Text("Call Sales",style: TextStyle(fontSize: w/25),),onPressed: (){
                                    launch("tel:"+widget.data_address[index]["sales"]);
                                  },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.black)),
                                    color: Colors.white,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

            ),

          ),
          drawer: SafeArea(child: mainDrawer()),
        );
      }
    }



  }
}
