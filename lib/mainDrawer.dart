import 'dart:convert';
import 'dart:ffi';

import 'package:circle_network/about.dart';
import 'package:circle_network/contact.dart';
import 'package:circle_network/support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'livetv.dart';
import 'package.dart';
import 'Emby.dart';

class mainDrawer extends StatefulWidget{

  @override
  _mainDrawerState createState() => _mainDrawerState();
}

class _mainDrawerState extends State<mainDrawer> {
  var data,data_address;



  Future getvalue()async{
    var response= await http.get(Uri.parse("http://circleapp-backend.herokuapp.com/packages?"));



    setState(() {
      var decode=json.decode(response.body);
      data=decode;
      //print(widget.a);
      //debugPrint('x=$x');
     // print("work");

    });
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();
    // this.getvalue();
    // this.getvalueAdress();
  }


  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    var x=MediaQuery.of(context).size.height;
    var y=MediaQuery.of(context).size.width;
    if(MediaQuery.of(context).orientation==Orientation.portrait) {
      return SafeArea(
        child: Drawer(
            child: Column(


              children: <Widget>[
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      Container(

                        height: x / 7.toDouble(),

                        decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: ExactAssetImage('assets/images/cn.png'),
                              fit: BoxFit.contain,
                            )
                        ),
                      ),
                      Text(
                        "Circle Network", style: TextStyle(fontSize: x / 25),),
                    ],

                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home,color: Colors.grey[700],),
                  title: Text("Home", style: TextStyle(color: Colors.black),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person,color: Colors.grey[700],),
                  title: Text("Support", style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            Support()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.add_shopping_cart,color: Colors.grey[700],),
                  title: Text(
                      "Packages", style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Packages()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment_ind,color: Colors.grey[700],),
                  title: Text("About", style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contacts,color: Colors.grey[700],),
                  title: Text("Contact", style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            Contact()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.movie,color: Colors.grey[700],),
                  title: Text("Emby", style: TextStyle(color: Colors.black)),
                  onTap: () async{
                    const url = 'http://emby.circleftp.net';
                    if (await canLaunch(url)) {
                    await launch(url);
                    } else {
                    throw 'Could not launch $url';
                    }
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(y / 30),
                      child: InkWell(
                        onTap: () async {
                          const url = 'http://yetfix.com/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(

                              child: Text("Develop By: ", style: TextStyle(

                                  fontSize: 18,
                                  fontFamily: 'Pacifico-Regular'),),),

                            Container(

                              child: Text("YetFix Limited", style: TextStyle(

                                  fontSize: 18,
                                  fontFamily: 'Pacifico-Regular'),),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )

              ],
            )
        ),
      );
    }else{
      return SafeArea(
        child: Drawer(
            child: Column(


              children: <Widget>[
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      Container(

                        height:  x/5.toDouble(),

                        decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: ExactAssetImage('assets/images/cn.png'),
                              fit: BoxFit.contain,
                            )
                        ),
                      ),
                      Text("Circle Network",style: TextStyle(fontSize: x/25),),
                    ],

                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.home),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Home",style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Support()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.person),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Support",style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Packages()),);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.add_shopping_cart),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Packages",style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.assignment_ind),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("About",style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.contacts),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Contact",style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async{
                          const url = 'http://yetfix.com/';
                          if (await canLaunch(url)) {
                          await launch(url);
                          } else {
                          throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.movie),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Emby",style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ListTile(
                //   leading: Icon(Icons.home),
                //   title: Text("Home",style: TextStyle(color: Colors.black),),
                //   onTap: (){
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Home(data: data,)),
                //     );
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.person),
                //   title: Text("Support",style: TextStyle(color: Colors.black)),
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Support(data_address: data_address,)));
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.add_shopping_cart),
                //   title: Text("Packages",style: TextStyle(color: Colors.black)),
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => Packages()),);
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.assignment_ind),
                //   title: Text("About",style: TextStyle(color: Colors.black)),
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.contacts),
                //   title: Text("Contact",style: TextStyle(color: Colors.black)),
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact(data_address: data_address)));
                //   },
                // ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:  EdgeInsets.all(y/30),
                      child: InkWell(
                        onTap: ()async {
                          const url = 'http://emby.circleftp.net';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(

                              child: Text("Develop By: ", style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Pacifico-Regular'),),),

                            Container(

                              child: Text("YetFix Limited",style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Pacifico-Regular'),),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )

              ],
            )
        ),
      );
    }

  }
}