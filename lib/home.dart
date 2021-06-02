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


  // Future getAllIPAndCheck()async{
  //   final ipv6 = await Ipify.ipv64();
  //   //print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e
  //   ipInString=ipv6.toString();
  //   //print(ipv6);
  //
  //   var response = await get(Uri.parse("http://circleftp.net/iplist.txt"));
  //   String content = response.body;
  //   List<String> result = content.split('\n');
  //   //print(result[0]);
  //   for(int i=0;i<result.length;i++){
  //     checkIpInList(result[i]);
  //
  //   }
  //
  //   //print(fullList1.length);
  //
  //
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //
  //   setState(()  {
  //     ipInOrList=fullList1.contains(ipInString);
  //
  //     sharedPreferences.setInt("len", fullList1.length);
  //
  //   });
  //   print(fullList1.length);
  //  // print(ipInOrList);
  //
  //
  //
  //   //print(fullList1.length);
  //
  //   //  //
  //   // var a= HttpClient().getUrl(Uri.parse('http://yetfix.com/iplist.txt'));
  //   //
  //   // new HttpClient().getUrl(Uri.parse('http://yetfix.com/iplist.txt'))
  //   //     .then((HttpClientRequest request) => request.close())
  //   //     .then((HttpClientResponse response) {
  //   //   response.transform(utf8.decoder).listen((data) {
  //   //     contents.write(data);
  //   //     // handle data
  //   //   });
  //   // });
  //   //
  //   // print(contents.runtimeType);
  //
  //   // print(listIp);
  //
  //   // new File("http://yetfix.com/iplist.txt")
  //   //     .openRead()
  //   //     .transform(utf8.decoder)
  //   //     .transform(new LineSplitter())
  //   //     .forEach((l) => listIp.add(l.toString()));
  //
  //
  //   // bool _validURL = Uri.parse("http://circleftp.net/iplist.txt").isAbsolute;
  //   // print(_validURL);
  //   // var response= await http.get(Uri.parse("http://circleftp.net/iplist.txt"));
  //   // var res=response.statusCode;
  //   // var decode=json.decode(response.body);
  //   // s=decode;
  //   // print(decode);
  //   // print("work");
  //   //
  //   // setState(() {
  //   //   print(res.toString()+" rlkfd");
  //   //   //print(widget.a);
  //   //   //debugPrint('x=$x');
  //   //
  //   // });
  // }
  //
  //
  // checkIpInList(var ipInString){
  //
  //   var s=ipInString;
  //   var len=s.length;
  //   List<String> res = s.split('.');
  //   var lastblock=res[2];
  //   var firstTwoBlock=res[0].toString()+"."+res[1].toString();
  //   int lastBlocInInteger=int.parse(lastblock);
  //   var lastCharcter=s[len-2];
  //
  //   // print(ipInString);
  //   //  print(lastCharcter.toString());
  //
  //   if(lastCharcter=='0'){
  //     // print("work 0");
  //
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+2).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+3).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+4).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+5).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+6).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+7).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+8).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+9).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+10).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+11).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+12).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+13).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+14).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+15).toString()+"."+i.toString());
  //     }
  //
  //
  //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(str+i.toString());
  //     // }
  //     //
  //     // var tempString;
  //     // var lastBitOfIp=str[newLan-2];
  //     // var secondLastBitOfIp=str[newLan-3];
  //     // int lastBitOfIpInteger=int.parse(lastBitOfIp);
  //     // int secondBitOfIpInteger=int.parse(secondLastBitOfIp);
  //     //
  //     // lastBitOfIpInteger=lastBitOfIpInteger+secondBitOfIpInteger*10;
  //     //
  //     // if (str != null && str.length >= 3) {
  //     //   tempString = str.substring(0, str.length - 3);
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
  //     //
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+2).toString()+"."+i.toString());
  //     //
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+3).toString()+"."+i.toString());
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+4).toString()+"."+i.toString());
  //     //
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+5).toString()+"."+i.toString());
  //     //
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+6).toString()+"."+i.toString());
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+7).toString()+"."+i.toString());
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+8).toString()+"."+i.toString());
  //     //
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+9).toString()+"."+i.toString());
  //     //
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+10).toString()+"."+i.toString());
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+11).toString()+"."+i.toString());
  //     //
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+12).toString()+"."+i.toString());
  //     //
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+13).toString()+"."+i.toString());
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+14).toString()+"."+i.toString());
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+15).toString()+"."+i.toString());
  //     // }
  //
  //
  //   }
  //   if(lastCharcter=="1"){
  //
  //     // print("work 1");
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+2).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+3).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+4).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+5).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+6).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+7).toString()+"."+i.toString());
  //     }
  //
  //
  //     // var tempString;
  //     // var lastBitOfIp=str[newLan-2];
  //     // var secondLastBitOfIp=str[newLan-3];
  //     // var thirdLastBitOfIp=str[newLan-3];
  //     // int lastBitOfIpInteger=int.parse(lastBitOfIp);
  //     // int secondBitOfIpInteger=int.parse(secondLastBitOfIp);
  //     // int thirdBitOfIpInteger=int.parse(thirdLastBitOfIp);
  //     //
  //     // lastBitOfIpInteger=lastBitOfIpInteger+secondBitOfIpInteger*10+thirdBitOfIpInteger*100;
  //     //
  //     // if (str != null && str.length >= 4) {
  //     //   tempString = str.substring(0, str.length - 4);
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
  //     //
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+2).toString()+"."+i.toString());
  //     //
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+3).toString()+"."+i.toString());
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+4).toString()+"."+i.toString());
  //     //
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+5).toString()+"."+i.toString());
  //     //
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+6).toString()+"."+i.toString());
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+7).toString()+"."+i.toString());
  //     // }
  //     //
  //
  //   }
  //   if(lastCharcter=="2"){
  //     // print("work 2");
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+2).toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+3).toString()+"."+i.toString());
  //     }
  //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(str+i.toString());
  //     // }
  //     //
  //     // var tempString;
  //     // var lastBitOfIp=str[newLan-2];
  //     // var secondLastBitOfIp=str[newLan-3];
  //     // int lastBitOfIpInteger=int.parse(lastBitOfIp);
  //     // int secondBitOfIpInteger=int.parse(secondLastBitOfIp);
  //     //
  //     // lastBitOfIpInteger=lastBitOfIpInteger+secondBitOfIpInteger*10;
  //     //
  //     // if (str != null && str.length >= 3) {
  //     //   tempString = str.substring(0, str.length - 3);
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
  //     //
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+2).toString()+"."+i.toString());
  //     //
  //     // }
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+3).toString()+"."+i.toString());
  //     // }
  //
  //
  //   }
  //   if(lastCharcter.toString()=="3"){
  //
  //     // print("work 3");
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
  //     }
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
  //     }
  //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(str+i.toString());
  //     // }
  //     //
  //     // var tempString;
  //     // var lastBitOfIp=str[newLan-2];
  //     // int lastBitOfIpInteger=int.parse(lastBitOfIp);
  //     //
  //     // if (str != null && str.length >= 2) {
  //     //   tempString = str.substring(0, str.length - 2);
  //     // }
  //     //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
  //     // }
  //
  //   }
  //   if(lastCharcter=="4"){
  //     // print("work 4");
  //     for(int i=0;i<256;i++){
  //       fullList1.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
  //     }
  //
  //     // for(int i=0;i<256;i++){
  //     //   fullList1.add(str+i.toString());
  //     // }
  //
  //
  //   }
  //
  //   // print(fullList1.contains("103.163.116.258"));
  // }


  @override
  void dispose() {
    print("work");
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


    Color color = Theme
        .of(context)
        .popupMenuTheme.color;


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




    if (MediaQuery.of(context).orientation == Orientation.portrait){
      // is portrait
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
              centerTitle: true,

            ),
          ),
          drawer: SafeArea(child: mainDrawer()),
          body: Stack(
            clipBehavior: Clip.none,
            children: [

              Positioned(
                top: 0,
                height: size.height-(size.height/14+size.height/14+size.height/14  +MediaQuery.of(context).padding.top),
                width: size.width,

                child: CustomScrollView(

                  slivers: <Widget>[
                    SliverAppBar(
                      iconTheme: IconThemeData(
                          color: Colors.black //change your color here
                      ),

                      leadingWidth: 30,
                      // actions: <Widget>[
                      //   Icon(
                      //     Icons.camera_front,
                      //     size: 40,
                      //   )
                      // ],
                      // title: Text("DashBoard"),
                      //leading: Icon(Icons.menu),
                      backgroundColor: Color(0xffF8F3ED),

                      expandedHeight: 200.0,
                      // title: Text("Circle Network"),
                      // floating: true,
                      stretch: true,

                      // floating: true,
                      // pinned: true,

                      automaticallyImplyLeading: false,


                      flexibleSpace: FlexibleSpaceBar(
                        // centerTitle: true,
                        //
                        // title: Text("Circle Network",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          background: Stack(
                            children: [
                              Image.asset("assets/images/cn4.png",width: size.width,fit: BoxFit.cover,),

                              // Positioned(
                              //     bottom: 0,
                              //     child: Container(child: Text("sdldkfjdl"),)),
                            ],
                          )),
                    ),

                    SliverList(

                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 4,
                      // ) ,
                      // delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      //   return new Container(
                      //       color: _randomPaint(index),
                      //       height: 150.0
                      //   );
                      // }),

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
                                        // new Image.asset(
                                        //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),


                                        // ClipOval(
                                        //
                                        //     child: Material(
                                        //         color: Colors.white,
                                        //         child: SizedBox(
                                        //             height: size.width/8,
                                        //             width: size.width/8,
                                        //             child: Icon(Icons.live_tv_outlined,size: size.width/12,color: Color(0xfff9d494),)))),
                                        new SizedBox(height: 3,),
                                        new Text('Live Tv',textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: wi/15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
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

                                height: size.width/2,
                                width: size.width/2,
                                child: new Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.transparent,
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
                height: size.height/14*2,
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

                          height: size.height/14,
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Need Information",style: TextStyle(fontSize: size.width/20,color: Colors.white)),
                              Row(
                                children: [
                                  Text("Call Now",style: TextStyle(fontSize: size.width/20,color: Colors.white)),
                                  Icon(Icons.call,color: Colors.white,)
                                ],
                              ),
                            ],
                          ),),
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
                                              : Colors.grey[200],
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
                                              : Colors.grey[200],
                                        ),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                                        }),
                                    IconButton(
                                        icon: Icon(
                                          Icons.payment,
                                          color: currentIndex == 3
                                              ? Colors.orange
                                              : Colors.grey[200],
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
          // body: Container(
          //   color: Color(0xff140E32),
          //
          //   child: Stack(
          //
          //     children: [
          //       Positioned(
          //         bottom: 0,
          //         left: 0,
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0),),
          //               gradient: LinearGradient(
          //                   colors: [Color(0xffF8F3ED), Color(0xffF8F3ED)])
          //           ),
          //
          //           width: size.width,
          //           height: size.height/15,
          //           child: Stack(
          //             clipBehavior: Clip.none, children: [
          //               // CustomPaint(
          //               //   size: Size(size.width, 80),
          //               //   painter: BNBCustomPainter(),
          //               // ),
          //               // Center(
          //               //   heightFactor: 0.6,
          //               //   child: FloatingActionButton(backgroundColor: Colors.orange, child: Icon(Icons.shopping_basket), elevation: 0.1,
          //               //       onPressed: () {}),
          //               // ),
          //               Container(
          //
          //                 width: size.width,
          //                 height: size.height/15,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                   children: [
          //                     IconButton(
          //                       icon: Icon(
          //                         Icons.home,
          //                         color: currentIndex == 0
          //                             ? Colors.black
          //                             : Colors.white,
          //                       ),
          //                       onPressed: () {
          //                         Navigator.push(
          //                           context,
          //                           MaterialPageRoute(
          //                               builder: (context) => Home()),
          //                         );
          //                       },
          //                       splashColor: Colors.white,
          //                     ),
          //                     IconButton(
          //                         icon: Icon(
          //                           Icons.call,
          //                           color: currentIndex == 1
          //                               ? Colors.orange
          //                               : Colors.white,
          //                         ),
          //                         onPressed: () {
          //
          //                           launch("tel:+09611800900");
          //
          //                         }),
          //                     // Container(
          //                     //   width: size.width * 0.20,
          //                     // ),
          //                     IconButton(
          //                         icon: Icon(
          //                           Icons.camera,
          //                           color: currentIndex == 2
          //                               ? Colors.orange
          //                               : Colors.white,
          //                         ),
          //                         onPressed: () {
          //                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
          //                         }),
          //                     IconButton(
          //                         icon: Icon(
          //                           Icons.payment,
          //                           color: currentIndex == 3
          //                               ? Colors.orange
          //                               : Colors.white,
          //                         ),
          //                         onPressed: () {
          //                           Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
          //                         }),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         top: 0,
          //         left: 0,
          //         height: size.height-(size.height/15+size.height/15
          //             +MediaQuery.of(context).padding.top),
          //         width: size.width,
          //         child: Container(
          //           child: SafeArea(
          //             child: Container(
          //
          //               child: ListView(
          //
          //                 children: [
          //                   Container(
          //
          //                     height: MediaQuery.of(context).size.height*.25,
          //                     child: ClipRRect(
          //                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight:Radius.circular(25) ),
          //                       child: Image.asset(
          //                         'assets/images/cn4.png',
          //                         fit: BoxFit.cover,
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(height: 10,),
          //                   // textSection,
          //                   Container(
          //
          //                     //padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          //                     height: MediaQuery.of(context).size.height-(MediaQuery.of(context).
          //                     size.height*.25+appBar_landscope.preferredSize.height+appBar_landscope.
          //                     preferredSize.height+MediaQuery.of(context).padding.bottom+MediaQuery.of(context).padding.top),
          //                     child: ListView(
          //                       children: [
          //                         Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                           crossAxisAlignment: CrossAxisAlignment.center,
          //                           children: [
          //
          //                             new Container(
          //                               height: size.width/1.7,
          //                               width: size.width/2.2,
          //                               child: new Card(
          //                                 elevation: 1.0,
          //                                 shape: RoundedRectangleBorder(
          //                                   borderRadius: BorderRadius.circular(20),
          //                                 ),
          //                                 //shadowColor: Colors.tealAccent,
          //
          //                                 color: Color(0xffF8F3ED),
          //                                 borderOnForeground: false,
          //                                 child: new InkResponse(
          //                                   child: new Column(
          //                                     // crossAxisAlignment: CrossAxisAlignment.center,
          //                                     // mainAxisAlignment: MainAxisAlignment.center,
          //                                     children: <Widget>[
          //                                       Padding(
          //                                         padding: const EdgeInsets.all(10.0),
          //                                         child: Container(
          //                                           decoration: BoxDecoration(
          //                                             color: Colors.purple[100],
          //                                             borderRadius: BorderRadius.all(Radius.circular(5))
          //                                           ),
          //                                             height: size.width/4,
          //                                             width: size.width/4,
          //
          //                                             child: Icon(Icons.live_tv_outlined,size: size.width/10,color: Colors.pink,)),
          //                                       ),
          //                                       // new Image.asset(
          //                                       //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
          //
          //
          //                                       // ClipOval(
          //                                       //
          //                                       //     child: Material(
          //                                       //         color: Colors.white,
          //                                       //         child: SizedBox(
          //                                       //             height: size.width/8,
          //                                       //             width: size.width/8,
          //                                       //             child: Icon(Icons.live_tv_outlined,size: size.width/12,color: Color(0xfff9d494),)))),
          //                                       new SizedBox(height: 3,),
          //                                       new Text('Live Tv',textAlign: TextAlign.center,
          //                                           style: TextStyle(
          //                                               fontSize: wi/15,
          //                                               color: Colors.black,
          //                                               fontWeight: FontWeight.bold,
          //                                               fontFamily: 'Pacifico-Regular')),
          //                                     ],
          //                                   ),
          //                                   onTap: () {
          //                                     Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTv1()),);
          //                                   },
          //                                 ),
          //                               ),
          //                             ),
          //
          //                             new Container(
          //                               height: size.width/1.7,
          //                               width: size.width/2.2,
          //                               child: new Card(
          //                                 elevation: 0.0,
          //                                 shape: RoundedRectangleBorder(
          //                                   borderRadius: BorderRadius.circular(20),
          //                                 ),
          //
          //                                 color: Colors.blueAccent[100],
          //                                 child: new InkResponse(
          //                                   child: new Column(
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     children: <Widget>[
          //                                       // new Image.asset(
          //                                       //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
          //                                       ClipOval(
          //
          //                                           child: Material(
          //
          //                                               color: Colors.white,
          //                                               child: SizedBox(
          //                                                   height: size.width/8,
          //                                                   width: size.width/8,
          //                                                   child: Icon(Icons.movie,size: size.width/12,color: Color(0xff7FBEF6),)))),
          //                                       new SizedBox(height: 3,),
          //                                       new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
          //                                     ],
          //                                   ),
          //                                   onTap: () {
          //                                     Navigator.push(context, MaterialPageRoute(builder: (context) => SamplePlayer()),);
          //                                   },
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                           children: [
          //                             new Container(
          //                               height: size.width/1.7,
          //                               width: size.width/2.2,
          //                               child: new Card(
          //                                 elevation: 0.0,
          //                                 shape: RoundedRectangleBorder(
          //                                   borderRadius: BorderRadius.circular(20),
          //                                 ),
          //
          //                                 color: Colors.deepPurpleAccent[100],
          //                                 child: new InkResponse(
          //                                   child: new Column(
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     children: <Widget>[
          //                                       // new Image.asset(
          //                                       //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
          //                                       ClipOval(
          //
          //                                           child: Material(
          //
          //                                               color: Colors.white,
          //                                               child: SizedBox(
          //                                                   height: size.width/8,
          //                                                   width: size.width/8,
          //                                                   child: Icon(Icons.monetization_on_outlined,size: size.width/12,color: Color(0xffBBAAFA),)))),
          //                                       new SizedBox(height: 3,),
          //                                       new Text('Cash',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
          //                                     ],
          //                                   ),
          //                                   onTap: () {
          //                                     Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment()),);
          //                                   },
          //                                 ),
          //                               ),
          //                             ),
          //                             // new Container(
          //                             //   child: new Card(
          //                             //     elevation: 0,
          //                             //     color: Colors.transparent,
          //                             //     child: InkResponse(
          //                             //       child: Column(
          //                             //         children: [
          //                             //           new Image.asset(
          //                             //             'assets/images/mb.png', height: MediaQuery.of(context).size.height/12, width: 100,),
          //                             //           new SizedBox(height: 3,),
          //                             //           new Text('Mobile banking',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/22),),
          //                             //         ],
          //                             //       ),
          //                             //       onTap: () {
          //                             //         Navigator.push(context, MaterialPageRoute(builder: (context) => MobileBanking()),);
          //                             //       },
          //                             //     ),
          //                             //   ),
          //                             // ),
          //                             new Container(
          //                               height: size.width/1.7,
          //                               width: size.width/2.2,
          //                               child: new Card(
          //                                 shape: RoundedRectangleBorder(
          //                                   borderRadius: BorderRadius.circular(20),
          //                                 ),
          //                                 color: Colors.pink[200],
          //                                 child: InkResponse(
          //                                   child: Column(
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     children: [
          //                                       ClipOval(
          //
          //                                           child: Material(
          //
          //                                               color: Colors.white,
          //                                               child: CircleAvatar(
          //                                                   radius: size.width/15,
          //                                                   backgroundColor: Colors.pink[50],
          //                                                   child: Image.asset("assets/images/bksh.png",width: size.width/12,height: size.width/12,)))),
          //
          //
          //                                       new SizedBox(height: 3,),
          //                                       Text("Bkash",textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,),),
          //
          //                                     ],
          //                                   ),
          //                                   onTap: () {
          //                                     Navigator.push(context, MaterialPageRoute(builder: (context) => bkashPayment()));
          //                                   },
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         Row(
          //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                           crossAxisAlignment: CrossAxisAlignment.center,
          //                           children: [
          //                             new Container(
          //                               height: size.width/1.7,
          //                               width: size.width/2.2,
          //                               child: new Card(
          //                                 elevation: 0.0,
          //                                 shape: RoundedRectangleBorder(
          //                                   borderRadius: BorderRadius.circular(20),
          //                                 ),
          //
          //                                 color: Colors.tealAccent[200],
          //                                 child: new InkResponse(
          //                                   child: new Column(
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     children: <Widget>[
          //                                       // new Image.asset(
          //                                       //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
          //                                       ClipOval(
          //
          //                                           child: Material(
          //
          //                                               color: Colors.white,
          //                                               child: SizedBox(
          //                                                   height: size.width/8,
          //                                                   width: size.width/8,
          //                                                   child: Icon(Icons.support_agent_sharp,size: size.width/12,color: Color(0xff79C8AD),)))),
          //                                       new SizedBox(height: 3,),
          //                                       new Text('Support',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
          //                                     ],
          //                                   ),
          //                                   onTap: () {
          //                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Support()),);
          //                                   },
          //                                 ),
          //                               ),
          //                             ),
          //                             new Container(
          //                               height: size.width/1.7,
          //                               width: size.width/2.2,
          //                               child: new Card(
          //                                 elevation: 0.0,
          //                                 shape: RoundedRectangleBorder(
          //                                   borderRadius: BorderRadius.circular(20),
          //                                 ),
          //
          //                                 color: Colors.deepOrangeAccent[100],
          //                                 child: new InkResponse(
          //                                   child: new Column(
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     children: <Widget>[
          //                                       // new Image.asset(
          //                                       //   'assets/images/livetv.png', height: MediaQuery.of(context).size.height/12, width: 100,),
          //                                       ClipOval(
          //
          //                                           child: Material(
          //
          //                                               color: Colors.white,
          //                                               child: SizedBox(
          //                                                   height: size.width/8,
          //                                                   width: size.width/8,
          //                                                   child: Icon(Icons.camera,size: size.width/12,color: Color(0xffFE937B),)))),
          //                                       new SizedBox(height: 3,),
          //                                       new Text('Packages',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/15,color: Colors.white,)),
          //                                     ],
          //                                   ),
          //                                   onTap: () {
          //                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Packages()),);
          //                                   },
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         )
          //                       ],
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

        ),
      );
    }else{

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
                  color: Colors.white, //change your color here
                ),

                title: Text('Circle Network',style: TextStyle(fontSize: w/30),),
                backgroundColor: Color(0xff6C60E0),
                centerTitle: true,
                leadingWidth: 30,

              )),
          drawer: SafeArea(child: mainDrawer()),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Color(0xff6C60E0),
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
                            RaisedButton(

                              disabledColor: Colors.transparent,

                              child: IconButton(
                                icon: Icon(
                                  Icons.home,
                                  color: currentIndex == 0
                                      ? Colors.black
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
                            ),
                            RaisedButton(
                              disabledColor: Colors.transparent,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.call,
                                    color: currentIndex == 1
                                        ? Colors.orange
                                        : Colors.white,
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
                                        : Colors.white,
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
                                        : Colors.white,
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
                              flex: 3,

                              // child: GridView.count(
                              //   scrollDirection: Axis.vertical,
                              //   shrinkWrap: true,
                              //   crossAxisCount: 3,
                              //   childAspectRatio: (1 / 1),
                              //   controller: new ScrollController(keepScrollOffset: false),
                              //  children: [
                              //    new Container(
                              //   //height: MediaQuery.of(context).size.height,
                              //   child: new InkResponse(
                              //     child: Padding(
                              //       padding: const EdgeInsets.only(top: 8.0),
                              //       child: new Column(
                              //         children: <Widget>[
                              //           new Image.asset(
                              //             'assets/images/livetv.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                              //           new Text('Live Tv',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20)),
                              //         ],
                              //       ),
                              //     ),
                              //     onTap: () {
                              //       Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTv1()),);
                              //     },
                              //   ),
                              // ),
                              //   // new Container(
                              //   //   child: new InkResponse(
                              //   //     child: Padding(
                              //   //       padding: const EdgeInsets.only(top: 8.0),
                              //   //       child: new Column(
                              //   //         children: <Widget>[
                              //   //           new Image.asset(
                              //   //             'assets/images/ftp.png', height: MediaQuery.of(context).size.height/8,
                              //   //             width: 100,),
                              //   //           new Text('FTP Server',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                              //   //         ],
                              //   //       ),
                              //   //     ),
                              //   //     onTap: () {
                              //   //       Navigator.push(context, MaterialPageRoute(builder: (context)=>FTV()));
                              //   //     },
                              //   //   ),
                              //   // ),
                              //   new Container(
                              //     child: new InkResponse(
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(top: 8.0),
                              //         child: new Column(
                              //           children: <Widget>[
                              //             new Image.asset(
                              //               'assets/images/movie.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                              //             // new SizedBox(height: 3,),
                              //             new Text('Movies',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20)),
                              //
                              //           ],
                              //         ),
                              //       ),
                              //       onTap: () {
                              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>SamplePlayer()));
                              //       },
                              //     ),
                              //   ),
                              //   new Container(
                              //     child: InkResponse(
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(top: 8.0),
                              //         child: Column(
                              //           children: [
                              //             new Image.asset(
                              //               'assets/images/pack.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                              //             new SizedBox(height: 3,),
                              //             new Text('Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                              //           ],
                              //         ),
                              //       ),
                              //       onTap: () {
                              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                              //       },
                              //     ),
                              //   ),
                              //   new Container(
                              //     child: InkResponse(
                              //       child: Column(
                              //         children: [
                              //           Container(
                              //             child: new Image.asset(
                              //               'assets/images/bksh.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                              //           ),
                              //           new SizedBox(height: 3,),
                              //           Text("Bkash Payment",textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                              //         ],
                              //       ),
                              //       onTap: () {
                              //         Navigator.push(context, MaterialPageRoute(builder: (context) => bkashPayment()));
                              //       },
                              //     ),
                              //   ),
                              //   new Container(
                              //     child: InkResponse(
                              //       child: Column(
                              //         children: [
                              //           new Image.asset(
                              //             'assets/images/cash.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                              //           new SizedBox(height: 3,),
                              //           new Text('Cash Payment', textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                              //         ],
                              //       ),
                              //       onTap: () {
                              //         Navigator.push(context, MaterialPageRoute(builder: (context) => CashPayment()),);
                              //       },
                              //     ),
                              //   ),
                              //   new Container(
                              //     child: InkResponse(
                              //       child: Column(
                              //         children: [
                              //           new Image.asset(
                              //             'assets/images/help.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                              //           new SizedBox(height: 3,),
                              //           Container(alignment: Alignment.center,child: new Text('Support',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),)),
                              //         ],
                              //       ),
                              //       onTap: () {
                              //         Navigator.push(context, MaterialPageRoute(builder: (context) => Support()),);
                              //       },
                              //     ),
                              //   ),
                              //   // new Container(
                              //   //   child: InkResponse(
                              //   //     child: Column(
                              //   //       children: [
                              //   //         new Image.asset(
                              //   //           'assets/images/partner.png', height: MediaQuery.of(context).size.height/8, width: 100,),
                              //   //         new SizedBox(height: 3,),
                              //   //         new Text('Website',textAlign: TextAlign.center,style: TextStyle(fontSize: h/20),),
                              //   //       ],
                              //   //     ),
                              //   //     onTap: () async {
                              //   //       const url = 'https://circlenetworkbd.net/';
                              //   //       if (await canLaunch(url)) {
                              //   //         await launch(url);
                              //   //       } else {
                              //   //         throw 'Could not launch $url';
                              //   //       }
                              //   //     },
                              //   //
                              //   //   ),
                              //   // ),
                              // ],
                              // )

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [

                                      new Container(
                                        height: c/2.2,
                                        width: c/2.2,
                                        padding: EdgeInsets.all(5),
                                        child: RaisedButton(
                                          color: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.orange)),
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
                                              new Text('Packages',textAlign: TextAlign.center,style: TextStyle(fontSize: wi/35,color: Colors.white,)),
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
    }

  }
}
