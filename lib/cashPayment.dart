import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'mainDrawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bkashPayment.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';
class CashPayment extends StatefulWidget {


  @override
  _CashPaymentState createState() => _CashPaymentState();
}



class _CashPaymentState extends State<CashPayment> {
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


  var data_address;

  Future getvalueAdress()async{
    var response= await http.get(Uri.parse("http://circleapp-backend.herokuapp.com/office-address?"));
    setState(() {
      var decode=json.decode(response.body);
      data_address=decode;
      print("work");
      //debugPrint('x=$x');

    });
  }


  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getvalueAdress();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    if(MediaQuery.of(context).orientation==Orientation.portrait){
      if(data_address==null||data_address.length==0){
        print("come");
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/15),
                child: new AppBar(title: Text('Cash Payment',style: TextStyle(fontSize: x/30),),centerTitle: true,backgroundColor: Color(0xffFF7F50),leadingWidth: 30,)),
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
                  height: size.height-(size.height/15+size.height/15
                      +MediaQuery.of(context).padding.top),
                  width: size.width,
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,

                        itemCount: office_Name.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding:  EdgeInsets.all(w/25),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-3, -3),
                                        color: Colors.grey,
                                        spreadRadius: 6,
                                        blurRadius: 6)
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[200]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(alignment: Alignment.center,child: Text(office_Name[index].toString(),
                                    style: new TextStyle( fontSize: w/12,
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
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: RaisedButton(child: Text("Call Sales",style: TextStyle(fontSize: 25),),onPressed: (){
                                        launch("tel:+88"+office_Sales[index]);
                                      },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: Colors.black)),
                                        color: Colors.white,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }

                    ),

                  ),
                ),
              ],
            ),
            drawer: SafeArea(child: mainDrawer()),
          ),
        );
      }else{

        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/15),child: new AppBar(title: Text('Cash Payment',style: TextStyle(fontSize: x/30),),centerTitle: true,backgroundColor: Color(0xffFF7F50),leadingWidth: 30,)),
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
                height: size.height-(size.height/15+size.height/15
                    +MediaQuery.of(context).padding.top),
                width: size.width,
                child: Container(
                  child: ListView.builder(itemCount: data_address.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding:  EdgeInsets.all(w/25),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(-3, -3),
                                      color: Colors.grey,
                                      spreadRadius: 6,
                                      blurRadius: 6)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(alignment: Alignment.center,child: Text(data_address[index]["office"].toString(),
                                  style: new TextStyle(fontFamily: 'Pacifico-Regular', fontSize: w/12,
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
                                  child: Text(data_address[index]["address"].toString(), style: TextStyle(color: Colors.black, fontSize: w/20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),


                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Sales : "+data_address[index]["sales"].toString(), style: TextStyle(
                                    fontSize: w/22,
                                    color: Colors.black,
                                    //decoration: TextDecoration.lineThrough
                                  ),textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: RaisedButton(child: Text("Call Now",style: TextStyle(fontSize: 25),),onPressed: (){
                                      launch("tel:"+data_address[index]["sales"]);
                                    },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.black)),
                                      color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }

                  ),

                ),
              ),
            ],
          ),
          drawer: SafeArea(child: mainDrawer()),
        );
      }
    }else{
      setState(() {
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      });
      if(data_address==null||data_address.length==0){
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),
              child: new AppBar(title: Text('Cash Payment',style: TextStyle(fontSize: w/30),),centerTitle: true,backgroundColor: Color(0xffFF7F50),leadingWidth: 30,)),
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
                  child: ListView.builder(itemCount: office_Name.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding:  EdgeInsets.fromLTRB(100,16,100,16),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(-3, -3),
                                      color: Colors.grey,
                                      spreadRadius: 6,
                                      blurRadius: 6)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(alignment: Alignment.center,child: Text(office_Name[index].toString(),
                                  style: new TextStyle( fontSize: w/18,
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
                                  padding: const EdgeInsets.only(top: 5.0),

                                ),

                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Sales : "+office_Sales[index].toString(), style: TextStyle(
                                    fontSize: w/35,
                                    color: Colors.black,


                                    //decoration: TextDecoration.lineThrough
                                  ),textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: RaisedButton(child: Text("Call Sales",style: TextStyle(fontSize: 25),),onPressed: (){
                                      launch("tel:+88"+office_Sales[index]);
                                    },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.black)),
                                      color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }

                  ),

                ),
              ),
            ],
          ),
          drawer: SafeArea(child: mainDrawer()),
        );
      }else{
        return Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),child: new AppBar(title: Text('Cash Payment',style: TextStyle(fontSize: w/30),),centerTitle: true,backgroundColor: Color(0xffFF7F50),leadingWidth: 30,)),
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
                  child: ListView.builder(itemCount: data_address.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding:  EdgeInsets.fromLTRB(100,16,100,16),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(-3, -3),
                                      color: Colors.grey,
                                      spreadRadius: 6,
                                      blurRadius: 6)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(alignment: Alignment.center,child: Text(data_address[index]["office"].toString(),
                                  style: new TextStyle(fontFamily: 'Pacifico-Regular', fontSize: w/18,
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
                                  child: Text(data_address[index]["address"].toString(), style: TextStyle(color: Colors.black, fontSize: w/35),
                                    textAlign: TextAlign.center,
                                  ),
                                ),


                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Sales : "+data_address[index]["sales"].toString(), style: TextStyle(
                                    fontSize: w/35,
                                    color: Colors.black,
                                    //decoration: TextDecoration.lineThrough
                                  ),textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: RaisedButton(child: Text("Call Now",style: TextStyle(fontSize: 25),),onPressed: (){
                                      launch("tel:"+data_address[index]["sales"]);
                                    },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.black)),
                                      color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }

                  ),

                ),
              ),
            ],
          ),
          drawer: SafeArea(child: mainDrawer()),
        );
      }
    }



  }
}
