import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'main.dart';


class Packages extends StatefulWidget {
  var data;

  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  var data;


  Future getvalue()async{
    var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
    setState(() {
      var decode=json.decode(response.body);
      data=decode;
      print(data);
  });
  }


  var pack_name=["Package 1","Package 2","Package 3","Package 4","Package 5","Package 6","Package 7","Package 8","Package 9","Package 10",];
  var pack_mbps=["10","15","20","25","30","35","40","45","50","55",];
  var pack_tk=["800","1000","1200","1500","2000","2500","3000","3500","4000","4500",];

  TextEditingController _name,_mobile,_address;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getvalue();
    //debugPrint("frist");
    _name = new TextEditingController();
    _mobile = new TextEditingController();
    _address = new TextEditingController();
    super.initState();

  }




  @override
  Widget build(BuildContext context) {

    if(data==null){
      //print("work");
      return Scaffold(
        appBar: AppBar(title: Text("Packages"),),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff2985DC),
                    Color(0xff2985DC),
                    Color(0xff0B447B)
                  ])),
          child: ListView.builder(
              itemCount: pack_name.length,
              itemBuilder: (context, index){
                return
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-3, -3),
                                color: Color(0xffA2CAEF).withOpacity(0.2),
                                spreadRadius: 6,
                                blurRadius: 6)
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffA2CAEF).withOpacity(0.6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          offset: Offset(-8, -1),
                                          spreadRadius: 2,
                                          blurRadius: 5),
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          offset: Offset(2, 2),
                                          spreadRadius: 4,
                                          blurRadius: 5)
                                    ],
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: [Color(0xffFE9B4D), Color(0xffFE8032)])),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(pack_name[index], style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.all(5),
                                    //   decoration: BoxDecoration(
                                    //       color: Color(0xff63A6E4),
                                    //       borderRadius: BorderRadius.circular(15)),
                                    //
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(pack_mbps[index]+" Mbps", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(pack_tk[index]+" Taka", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.lineThrough
                                  ),
                                  ),

                                ],
                              ),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  showDialog(context: context,builder: (dialogContex){
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                      ),
                                      elevation: 0,
                                      title: new Text("Your Information",textAlign: TextAlign.center,),

                                      content: Container(

                                        width: double.maxFinite,
                                        child: new ListView(
                                          shrinkWrap: true,
                                          // height: 350,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: new TextField(
                                                decoration: new InputDecoration(hintText: "Name"),
                                                controller: _name,

                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: new TextField(
                                                keyboardType: TextInputType.phone,
                                                decoration: new InputDecoration(hintText: "Mobile"),
                                                controller: _mobile,

                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: new TextField(
                                                decoration: new InputDecoration(hintText: "Address"),
                                                controller: _address,
                                                maxLines: 3,

                                              ),
                                            ),
                                            // new FlatButton(
                                            //   child: new Text("Submit"),
                                            //   onPressed: (){
                                            //
                                            //     Navigator.pop(dialogContex);
                                            //   },
                                            // )
                                          ],
                                        ),

                                      ),
                                      actions: <Widget>[
                                        new FlatButton(
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.pop(dialogContex);
                                            }),
                                        new FlatButton(
                                            child: const Text('Submit'),
                                            onPressed: () {
                                              Navigator.pop(dialogContex);
                                            })
                                      ],

                                    );
                                  });

                                },
                                child: Container(
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
              }
          ),
        ),
      );
    }else{
      //print("not work");
      return Scaffold(
        appBar: AppBar(title: Text("Packages"),),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xffc0c0c0),
                    Color(0xffFFFEDC),
                    //Color(0xffFFA500)
                  ])),
          child: Container(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index){
                  return
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(-3, -3),
                                  color: Color(0xffA2CAEF).withOpacity(0.2),
                                  spreadRadius: 6,
                                  blurRadius: 6)
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffA2CAEF).withOpacity(0.6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white.withOpacity(0.2),
                                            offset: Offset(-8, -1),
                                            spreadRadius: 2,
                                            blurRadius: 5),
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            offset: Offset(2, 2),
                                            spreadRadius: 4,
                                            blurRadius: 5)
                                      ],
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [Color(0xffFE9B4D), Color(0xffFE8032)])),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data[index]["name"], style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      ),
                                      // Container(
                                      //   padding: EdgeInsets.all(5),
                                      //   decoration: BoxDecoration(
                                      //       color: Color(0xff63A6E4),
                                      //       borderRadius: BorderRadius.circular(15)),
                                      //
                                      // )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(data[index]["band"].toString()+" Mbps", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index]["price"].toString()+" Taka", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      //decoration: TextDecoration.lineThrough
                                    ),
                                    ),

                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: (){
                                    showDialog(context: context,builder: (dialogContex){
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                            elevation: 0,
                                            title: new Text("Your Information",textAlign: TextAlign.center,),

                                        content: Container(

                                          width: double.maxFinite,
                                          child: new ListView(
                                            shrinkWrap: true,
                                            // height: 350,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: new TextField(
                                                  decoration: new InputDecoration(hintText: "Name"),
                                                  controller: _name,

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: new TextField(
                                                  keyboardType: TextInputType.phone,
                                                  decoration: new InputDecoration(hintText: "Mobile"),
                                                  controller: _mobile,

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: new TextField(
                                                  decoration: new InputDecoration(hintText: "Address"),
                                                  controller: _address,
                                                  maxLines: 3,

                                                ),
                                              ),
                                              // new FlatButton(
                                              //   child: new Text("Submit"),
                                              //   onPressed: (){
                                              //
                                              //     Navigator.pop(dialogContex);
                                              //   },
                                              // )
                                            ],
                                          ),

                                        ),
                                        actions: <Widget>[
                                          new FlatButton(
                                              child: const Text('CANCEL'),
                                              onPressed: () {
                                                Navigator.pop(dialogContex);
                                              }),
                                          new FlatButton(
                                              child: const Text('Submit'),
                                              onPressed: () {
                                                Navigator.pop(dialogContex);
                                              })
                                        ],

                                      );
                                    });

                                  },
                                  child: Container(
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                }
            ),
          ),
        ),
      );
    }

  }
}


