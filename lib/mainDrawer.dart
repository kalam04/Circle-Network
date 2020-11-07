import 'dart:convert';
import 'dart:ffi';

import 'package:circle_network/about.dart';
import 'package:circle_network/contact.dart';
import 'package:circle_network/support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'livetv.dart';
import 'package.dart';

class mainDrawer extends StatefulWidget{

  @override
  _mainDrawerState createState() => _mainDrawerState();
}

class _mainDrawerState extends State<mainDrawer> {
  var data,data_address;



  Future getvalue()async{
    var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
    setState(() {
      var decode=json.decode(response.body);
      data=decode;
      //print(widget.a);
      //debugPrint('x=$x');
      print("work");

    });
  }
  Future getvalueAdress()async{
    var response= await http.get("http://circleapp-backend.herokuapp.com/office-address?");
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
    this.getvalue();
    this.getvalueAdress();
  }

  @override
  Widget build(BuildContext context) {
    var x=MediaQuery.of(context).size.height;
    var y=MediaQuery.of(context).size.width;

    return SafeArea(
      child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    Container(

                      height:  x/7.toDouble(),

                      decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: ExactAssetImage('assets/images/cn.png'),
                            fit: BoxFit.contain,
                          )
                      ),
                    ),
                    Text("Circle Network",style: TextStyle(fontSize: 25),),
                  ],

                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home(data: data,)),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Support"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Support(data_address: data_address,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text("Packages"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Packages()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment_ind),
                title: Text("About"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contact"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact(data_address: data_address)));
                },
              ),

              Expanded(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:  EdgeInsets.all(y/30),
                      child: Row(
                          //mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(

                              child: Text("Develop By: ", style: TextStyle(color: Colors.black,fontSize: y/18,fontFamily: 'Pacifico-Regular'),),),

                            Container(

                              child: Text("YetFix Limited",style: TextStyle(color: Colors.black,fontSize: y/20,fontFamily: 'Pacifico-Regular'),),

                            ),
                              ],
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