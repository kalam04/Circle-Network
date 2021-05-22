// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:async';
// import 'mainDrawer.dart';
//
// class Movies extends StatefulWidget {
//   @override
//   _MoviesState createState() => _MoviesState();
// }
//
// class _MoviesState extends State<Movies> {
//   final Completer<InAppWebViewController> _controller2 = Completer<InAppWebViewController>();
//
//   Future<bool> _willPopCallback() async {
//     InAppWebViewController webViewController = await _controller2.future;
//     bool canNavigate = await webViewController.canGoBack();
//     if (canNavigate) {
//       webViewController.goBack();
//       return false;
//     } else {
//       return true;
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _willPopCallback();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var w=MediaQuery.of(context).size.width;
//     var x=MediaQuery.of(context).size.height;
//     if(MediaQuery.of(context).orientation==Orientation.portrait) {
//       return WillPopScope(
//         onWillPop: _willPopCallback,
//         child: Scaffold(
//           appBar: PreferredSize(preferredSize: Size.fromHeight(x / 13),
//               child: new AppBar(title: Center(
//                   child: Text('Movies', style: TextStyle(fontSize: x / 30),)),
//                 centerTitle: true,
//                 leadingWidth: 0,
//                 backgroundColor: Color(0xffFF7F50),)),
//           body: SafeArea(
//             child: InAppWebView(
//               initialUrl: "http://circleftp.net/",
//               initialHeaders: {},
//               initialOptions: InAppWebViewGroupOptions(
//                 crossPlatform: InAppWebViewOptions(
//                     debuggingEnabled: true,
//                     useOnDownloadStart: true
//                 ),
//               ),
//               onWebViewCreated: (InAppWebViewController webViewController) {
//                 _controller2.complete(webViewController);
//               },
//               onLoadStart: (InAppWebViewController controller, String url) {},
//               onLoadStop: (InAppWebViewController controller, String url) {},
//               onDownloadStart: (controller, url) async {
//                 // print("onDownloadStart $url");
//                 //
//                 //   const url = 'https://circlenetworkbd.net/';
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//
//                 // final taskId = await FlutterDownloader.enqueue(
//                 //
//                 //   url: url,
//                 //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
//                 //       ExtStorage.DIRECTORY_DOWNLOADS),
//                 //   // savedDir: (await getExternalStorageDirectory()).path,
//                 //   showNotification: true, // show download progress in status bar (for Android)
//                 //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//                 // );
//               },
//             ),
//           ),
//           drawer: SafeArea(child: mainDrawer()),
//
//
//         ),
//       );
//     }else{
//       return WillPopScope(
//         onWillPop: _willPopCallback,
//         child: Scaffold(
//           appBar: PreferredSize(preferredSize: Size.fromHeight(w / 16),
//               child: new AppBar(title: Center(
//                   child: Text('Movies', style: TextStyle(fontSize: w / 30),)),
//                 centerTitle: true,
//                 leadingWidth: 0,
//                 backgroundColor: Color(0xffFF7F50),)),
//           body: SafeArea(
//             child: InAppWebView(
//               initialUrl: "http://circleftp.net/",
//               initialHeaders: {},
//               initialOptions: InAppWebViewGroupOptions(
//                 crossPlatform: InAppWebViewOptions(
//                     debuggingEnabled: true,
//                     useOnDownloadStart: true
//                 ),
//               ),
//               onWebViewCreated: (InAppWebViewController webViewController) {
//                 _controller2.complete(webViewController);
//               },
//               onLoadStart: (InAppWebViewController controller, String url) {},
//               onLoadStop: (InAppWebViewController controller, String url) {},
//               onDownloadStart: (controller, url) async {
//                 // print("onDownloadStart $url");
//                 //
//                 //   const url = 'https://circlenetworkbd.net/';
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//
//                 // final taskId = await FlutterDownloader.enqueue(
//                 //
//                 //   url: url,
//                 //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
//                 //       ExtStorage.DIRECTORY_DOWNLOADS),
//                 //   // savedDir: (await getExternalStorageDirectory()).path,
//                 //   showNotification: true, // show download progress in status bar (for Android)
//                 //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//                 // );
//               },
//             ),
//           ),
//           drawer: SafeArea(child: mainDrawer()),
//
//
//         ),
//       );
//     }
//   }
// }


import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle_network/mainDrawer.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Search.dart';
import 'VlcPlayer.dart';
import 'flickVideoPlayer.dart';


var fullList=[];
var ipInString;
bool ipInOrList=false;
var dataCheck;

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  var data20191,
      data20173,
      data29605,
      data289,
      data20120,
      data285,
      data20151,
      data20068,
      data20029,
      data19960,
      data474,
      list,
      url,
      result,
      decode_data,
      get_data,
      search_movie;
  var s = "http://circleftp.net/cnapp/?type=category&term_id=";
  TextEditingController _controller;
  var name;
  var checkLenOfList;

  Future getvalue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   checkLenOfList= sharedPreferences.getInt("len");

   //print(checkLenOfList);

    var respons20191 = await http.get(
      Uri.parse("http://circleftp.net/category_by_post/",
    ));

    setState(() {
      var decode20191 = json.decode(respons20191.body);

      data20191 = decode20191;
     // print(decode20191);

    });

  }

  bool isSearching = false;
  var catagori = [
    "Animation Dubbed Movies",
    "Animation Movie Japanese",
    "Animation Movies",
    "English Foreign Hindi Dubbed Movies",
    "English Movies",
    "Foreign Dubbed Movies",
    "Foreign Language Movies",
    "Hindi Movies",
    "South Indian Dubbed",
    "South Indian Movies",
  ];

  void _filterCountries(value) {
    setState(() {
      search_movie = data20191
          .where((movie) =>
          movie['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }


  String content="dkf";
  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow[200] : Colors.grey,
        ),
      );
    },
  );

  Future getAllIPAndCheck()async{

    final ipv6 = await Ipify.ipv64();
    //print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e
    ipInString=ipv6.toString();
    //print(ipv6);

    var response = await get(Uri.parse("http://circleftp.net/iplist.txt"));
     content = response.body;
    List<String> result = content.split('\n');

    //print(result[0]);
    for(int i=0;i<result.length;i++){
      checkIpInList(result[i]);

    }

    //print(fullList.length);



    setState(() {
      dataCheck=1;
      ipInOrList=fullList.contains(ipInString);
    });

   // print(ipInOrList);

    //print(fullList.length);

    //  //
    // var a= HttpClient().getUrl(Uri.parse('http://yetfix.com/iplist.txt'));
    //
    // new HttpClient().getUrl(Uri.parse('http://yetfix.com/iplist.txt'))
    //     .then((HttpClientRequest request) => request.close())
    //     .then((HttpClientResponse response) {
    //   response.transform(utf8.decoder).listen((data) {
    //     contents.write(data);
    //     // handle data
    //   });
    // });
    //
    // print(contents.runtimeType);

    // print(listIp);

    // new File("http://yetfix.com/iplist.txt")
    //     .openRead()
    //     .transform(utf8.decoder)
    //     .transform(new LineSplitter())
    //     .forEach((l) => listIp.add(l.toString()));


    // bool _validURL = Uri.parse("http://circleftp.net/iplist.txt").isAbsolute;
    // print(_validURL);
    // var response= await http.get(Uri.parse("http://circleftp.net/iplist.txt"));
    // var res=response.statusCode;
    // var decode=json.decode(response.body);
    // s=decode;
    // print(decode);
    // print("work");
    //
    // setState(() {
    //   print(res.toString()+" rlkfd");
    //   //print(widget.a);
    //   //debugPrint('x=$x');
    //
    // });
  }


  checkIpInList(var ipInString){

    var s=ipInString;
    var len=s.length;
    List<String> res = s.split('.');
    var lastblock=res[2];
    var firstTwoBlock=res[0].toString()+"."+res[1].toString();
    int lastBlocInInteger=int.parse(lastblock);
    var lastCharcter=s[len-2];

    // print(ipInString);
    //  print(lastCharcter.toString());

    if(lastCharcter=='0'){
      // print("work 0");

      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+2).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+3).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+4).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+5).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+6).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+7).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+8).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+9).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+10).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+11).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+12).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+13).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+14).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+15).toString()+"."+i.toString());
      }



      // for(int i=0;i<256;i++){
      //   fullList.add(str+i.toString());
      // }
      //
      // var tempString;
      // var lastBitOfIp=str[newLan-2];
      // var secondLastBitOfIp=str[newLan-3];
      // int lastBitOfIpInteger=int.parse(lastBitOfIp);
      // int secondBitOfIpInteger=int.parse(secondLastBitOfIp);
      //
      // lastBitOfIpInteger=lastBitOfIpInteger+secondBitOfIpInteger*10;
      //
      // if (str != null && str.length >= 3) {
      //   tempString = str.substring(0, str.length - 3);
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
      //
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+2).toString()+"."+i.toString());
      //
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+3).toString()+"."+i.toString());
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+4).toString()+"."+i.toString());
      //
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+5).toString()+"."+i.toString());
      //
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+6).toString()+"."+i.toString());
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+7).toString()+"."+i.toString());
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+8).toString()+"."+i.toString());
      //
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+9).toString()+"."+i.toString());
      //
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+10).toString()+"."+i.toString());
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+11).toString()+"."+i.toString());
      //
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+12).toString()+"."+i.toString());
      //
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+13).toString()+"."+i.toString());
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+14).toString()+"."+i.toString());
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+15).toString()+"."+i.toString());
      // }


    }
    if(lastCharcter=="1"){

      // print("work 1");
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+2).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+3).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+4).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+5).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+6).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+7).toString()+"."+i.toString());
      }


      // var tempString;
      // var lastBitOfIp=str[newLan-2];
      // var secondLastBitOfIp=str[newLan-3];
      // var thirdLastBitOfIp=str[newLan-3];
      // int lastBitOfIpInteger=int.parse(lastBitOfIp);
      // int secondBitOfIpInteger=int.parse(secondLastBitOfIp);
      // int thirdBitOfIpInteger=int.parse(thirdLastBitOfIp);
      //
      // lastBitOfIpInteger=lastBitOfIpInteger+secondBitOfIpInteger*10+thirdBitOfIpInteger*100;
      //
      // if (str != null && str.length >= 4) {
      //   tempString = str.substring(0, str.length - 4);
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
      //
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+2).toString()+"."+i.toString());
      //
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+3).toString()+"."+i.toString());
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+4).toString()+"."+i.toString());
      //
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+5).toString()+"."+i.toString());
      //
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+6).toString()+"."+i.toString());
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+7).toString()+"."+i.toString());
      // }
      //

    }
    if(lastCharcter=="2"){
      // print("work 2");
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+2).toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+3).toString()+"."+i.toString());
      }

      // for(int i=0;i<256;i++){
      //   fullList.add(str+i.toString());
      // }
      //
      // var tempString;
      // var lastBitOfIp=str[newLan-2];
      // var secondLastBitOfIp=str[newLan-3];
      // int lastBitOfIpInteger=int.parse(lastBitOfIp);
      // int secondBitOfIpInteger=int.parse(secondLastBitOfIp);
      //
      // lastBitOfIpInteger=lastBitOfIpInteger+secondBitOfIpInteger*10;
      //
      // if (str != null && str.length >= 3) {
      //   tempString = str.substring(0, str.length - 3);
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
      //
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+2).toString()+"."+i.toString());
      //
      // }
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+3).toString()+"."+i.toString());
      // }


    }
    if(lastCharcter.toString()=="3"){

      // print("work 3");
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
      }
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+(lastBlocInInteger+1).toString()+"."+i.toString());
      }

      // for(int i=0;i<256;i++){
      //   fullList.add(str+i.toString());
      // }
      //
      // var tempString;
      // var lastBitOfIp=str[newLan-2];
      // int lastBitOfIpInteger=int.parse(lastBitOfIp);
      //
      // if (str != null && str.length >= 2) {
      //   tempString = str.substring(0, str.length - 2);
      // }
      //
      // for(int i=0;i<256;i++){
      //   fullList.add(tempString+(lastBitOfIpInteger+1).toString()+"."+i.toString());
      // }

    }
    if(lastCharcter=="4"){
      // print("work 4");
      for(int i=0;i<256;i++){
        fullList.add(firstTwoBlock+"."+lastBlocInInteger.toString()+"."+i.toString());
      }

      // for(int i=0;i<256;i++){
      //   fullList.add(str+i.toString());
      // }


    }

    // print(fullList.contains("103.163.116.258"));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    this.getvalue();
    this._deleteCacheDir();
    this._deleteAppDir();
    this.getAllIPAndCheck();

  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
    _controller.dispose();

  }

  bool _fromTop=true;

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

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    Size size=MediaQuery.of(context).size;

   //print(checkLenOfList);
   //  print(fullList.length);
   //  print(content);

    if(dataCheck==null){
      if(content==null){
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: MediaQuery.of(context).orientation == Orientation.landscape
              ? null
              : AppBar(
            title: Text("Circle Network"),
            centerTitle: true,
            backgroundColor: Colors.black,
            leadingWidth: 30,
          ),
          body: Container(
            child: Image.asset("assets/images/notuseer.jpg",height: size.height,),
          ),

        );
      }else{
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: MediaQuery.of(context).orientation == Orientation.landscape
              ? null
              : AppBar(
            title: Text("Circle Network"),
            centerTitle: true,
            backgroundColor: Colors.black,
            leadingWidth: 30,
          ),

        );
      }

    }
    else{

        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: MediaQuery.of(context).orientation == Orientation.landscape
                ? null
                : AppBar(
              title: Text("Circle Network"),
              centerTitle: true,
              backgroundColor: Colors.black,
              leadingWidth: 30,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),


                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(

                            color: Colors.white,width: 1)
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      onChanged: (text) {
                        name = text;
                      },
                      controller: _controller,
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.transparent)),
                        // border: OutlineInputBorder(),
                        //labelText: 'Movie Name',
                        hintText: "Search Movie",
                        hintStyle: TextStyle(fontSize: w / 20, color: Colors.white),
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onTap: () {
                            if (name.length > 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search(
                                        movie_name: name,
                                      )));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurpleAccent[50],
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: data20191 == null ? 0 : data20191.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    data20191[index]["custom_cat_name"].toString(),
                                    style: TextStyle(
                                        fontSize: w / 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 200,
                                width: double.infinity,
                                child: ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data20191[index]["movies"] == null
                                        ? 0
                                        : data20191[index]["movies"].length,
                                    itemBuilder: (BuildContext contex, int inde) {
                                      return InkWell(
                                        onTap: () {

                                          // InkWell(onTap: (){
                                          showGeneralDialog(
                                              barrierLabel: "Label",
                                              barrierDismissible: true,
                                              // barrierColor: Colors.black,
                                              transitionDuration: Duration(milliseconds: 700),
                                              context: context,
                                              pageBuilder: (context, anmi1, anime2){
                                                return Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Container(

                                                    height: size.height/2.8,
                                                    width: size.width,
                                                    child: MovieDialog(
                                                      image: data20191[index]["movies"][inde]["banner"].toString(),
                                                      name: data20191[index]["movies"][inde]["name"].toString(),
                                                      url: data20191[index]["movies"][inde]["media"].toString(),
                                                      Cat_id: index,
                                                      id: inde,
                                                      data: data20191,
                                                    ),
                                                    margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                                    ),
                                                  ),
                                                );

                                              },
                                              transitionBuilder: (context, anim1,anim2, child){
                                                return SlideTransition(
                                                  position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
                                                  child: child,
                                                );
                                              }
                                          );
                                        },


                                        // showGeneralDialog(
                                        //     barrierLabel: "Label",
                                        //     barrierDismissible: true,
                                        //     // barrierColor: Colors.black,
                                        //     transitionDuration: Duration(milliseconds: 700),
                                        //     context: context,
                                        //     pageBuilder: (context, anmi1, anime2){
                                        //
                                        //       return AlertDialog(
                                        //         backgroundColor: Colors.black,
                                        //         shape: RoundedRectangleBorder(
                                        //             borderRadius: BorderRadius.circular(16)
                                        //         ),
                                        //         elevation: 0,
                                        //         title: new Text("Choose ",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                        //
                                        //         content: Container(
                                        //           color: Colors.black,
                                        //           width: size.width,
                                        //           child: new ListView(
                                        //             shrinkWrap: true,
                                        //             // height: 350,
                                        //             children: <Widget>[
                                        //               // InkWell(
                                        //               //     onTap: (){
                                        //               //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAppScaffold(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                        //               //     },
                                        //               //     child: Text("Play With VLC Player".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
                                        //               // SizedBox(height: 20,),
                                        //               InkWell(onTap: (){
                                        //                 Navigator.pushReplacement(contex, MaterialPageRoute(builder: (contex) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                        //                 },
                                        //                   child: Center(child: Container(
                                        //                     decoration: BoxDecoration(
                                        //                       color: Colors.white,
                                        //                       borderRadius: BorderRadius.circular(5),
                                        //                     ),
                                        //
                                        //                       child: Padding(
                                        //                     padding: const EdgeInsets.all(4.0),
                                        //                     child: Text("Play Movie".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.black,fontWeight: FontWeight.bold),),
                                        //                   )))),
                                        //               SizedBox(height: 20,),
                                        //               InkWell(child: Center(child: Container(
                                        //
                                        //                   decoration: BoxDecoration(
                                        //                     color: Colors.white,
                                        //                     borderRadius: BorderRadius.circular(5),
                                        //                   ),
                                        //                   child: Padding(
                                        //                     padding: const EdgeInsets.all(4.0),
                                        //                     child: Text("Download".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.black,fontWeight: FontWeight.bold),),
                                        //                   ))),
                                        //                 onTap: () async{
                                        //                   if (await canLaunch(data20191[index]["movies"][inde]["media"].toString())) {
                                        //                     await launch(data20191[index]["movies"][inde]["media"].toString());
                                        //                   } else {
                                        //                     throw 'Could not launch $data20191[index]["movies"][inde]["media"].toString()';
                                        //                   }
                                        //
                                        //
                                        //                 },
                                        //               )
                                        //
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         actions: <Widget>[
                                        //           new TextButton(
                                        //               child: const Text('CANCEL',style: TextStyle(color: Colors.white),),
                                        //               onPressed: () {
                                        //                 Navigator.pop(context);
                                        //               }),
                                        //
                                        //         ],
                                        //       );
                                        //     },
                                        //     transitionBuilder: (context, anim1,anim2, child){
                                        //       return SlideTransition(
                                        //         position: Tween(begin: Offset(0, _fromTop ? -1 : 1), end: Offset(0, 0)).animate(anim1),
                                        //         child: child,
                                        //       );
                                        //     }
                                        // );


                                        // Navigator.push(contex, MaterialPageRoute(builder: (contex) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             MyAppScaffold(
                                        //               name: data20191[index]
                                        //                           ["movies"][inde]
                                        //                       ["name"]
                                        //                   .toString(),
                                        //               url: data20191[index]
                                        //                           ["movies"][inde]
                                        //                       ["media"]
                                        //                   .toString(),
                                        //               Cat_id: index,
                                        //               id: inde,
                                        //               data: data20191,
                                        //             )));
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Better(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                        // },

                                        child:  Container(
                                          height: 200,
                                          width: MediaQuery.of(context).size.width * .4,
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 8.0),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl: data20191[index]["movies"][inde]["banner"].toString(),
                                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                  Center(
                                                    child: spinkit,
                                                  ),
                                              errorWidget: (context, url, error) =>
                                                  Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        //     // Row(
                                        //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     //   children: [
                                        //     //     InkWell(child: Container(
                                        //     //         color: Colors.white,
                                        //     //         child: Padding(
                                        //     //           padding: const EdgeInsets.all(2.0),
                                        //     //           child: Text("Play",style: TextStyle(color: Colors.black),),
                                        //     //         )),
                                        //     //       onTap: (){
                                        //     //         Navigator.push(contex, MaterialPageRoute(builder: (contex) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                        //     //       },),
                                        //     //     InkWell(child: Container(
                                        //     //         color: Colors.white,
                                        //     //         child: Padding(
                                        //     //           padding: const EdgeInsets.all(2.0),
                                        //     //           child: Text("Download",style: TextStyle(color: Colors.black)),
                                        //     //         )),
                                        //     //       onTap: () async{
                                        //     //         if (await canLaunch(data20191[index]["movies"][inde]["media"].toString())) {
                                        //     //         await launch(data20191[index]["movies"][inde]["media"].toString());
                                        //     //         } else {
                                        //     //         throw 'Could not launch $data20191[index]["movies"][inde]["media"].toString()';
                                        //     //         }
                                        //     //     },),
                                        //     //   ],
                                        //     // )
                                        //   ],
                                        // ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: 20,),
              ],
            ),

          );
        }else{
          return Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colors.white,width: 1)
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      onChanged: (text) {
                        name = text;
                      },
                      controller: _controller,
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(),
                        //labelText: 'Movie Name',
                        hintText: "Search Movie",
                        hintStyle: TextStyle(fontSize: h / 20, color: Colors.white),
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onTap: () {
                            if (name.length > 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search(
                                        movie_name: name,
                                      )));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurpleAccent[50],
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: data20191 == null ? 0 : data20191.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    data20191[index]["custom_cat_name"].toString(),
                                    style: TextStyle(
                                        fontSize: h / 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 200,
                                width: double.infinity,
                                child: ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data20191[index]["movies"] == null
                                        ? 0
                                        : data20191[index]["movies"].length,
                                    itemBuilder: (BuildContext contex, int inde) {
                                      return InkWell(
                                        onTap: () {

                                          showGeneralDialog(
                                              barrierLabel: "Label",
                                              barrierDismissible: true,
                                              // barrierColor: Colors.black,
                                              transitionDuration: Duration(milliseconds: 700),
                                              context: context,
                                              pageBuilder: (context, anmi1, anime2){
                                                return Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Container(

                                                    height: size.height/2.8,
                                                    width: size.width,
                                                    child: MovieDialog(
                                                      image: data20191[index]["movies"][inde]["banner"].toString(),
                                                      name: data20191[index]["movies"][inde]["name"].toString(),
                                                      url: data20191[index]["movies"][inde]["media"].toString(),
                                                      Cat_id: index,
                                                      id: inde,
                                                      data: data20191,
                                                    ),
                                                    margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                                    ),
                                                  ),
                                                );

                                              },
                                              transitionBuilder: (context, anim1,anim2, child){
                                                return SlideTransition(
                                                  position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
                                                  child: child,
                                                );
                                              }
                                          );

                                          // showGeneralDialog(
                                          //     barrierLabel: "Label",
                                          //     barrierDismissible: true,
                                          //     // barrierColor: Colors.black,
                                          //     transitionDuration: Duration(milliseconds: 700),
                                          //     context: context,
                                          //     pageBuilder: (context, anmi1, anime2){
                                          //
                                          //       return AlertDialog(
                                          //         backgroundColor: Colors.black,
                                          //         shape: RoundedRectangleBorder(
                                          //             borderRadius: BorderRadius.circular(16)
                                          //         ),
                                          //         elevation: 0,
                                          //         title: new Text("Choose Player",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                          //
                                          //         content: Container(
                                          //           color: Colors.black,
                                          //           width: size.width,
                                          //           child: new ListView(
                                          //             shrinkWrap: true,
                                          //             // height: 350,
                                          //             children: <Widget>[
                                          //               // InkWell(
                                          //               //     onTap: (){
                                          //               //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAppScaffold(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                          //               //     },
                                          //               //     child: Text("Play With VLC Player".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
                                          //               // SizedBox(height: 20,),
                                          //               InkWell(onTap: (){
                                          //                 Navigator.pushReplacement(contex, MaterialPageRoute(builder: (contex) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                          //               },child: Center(child: Text("Play Movie".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),))),
                                          //               SizedBox(height: 20,),
                                          //               InkWell(child: Center(child: Text("Download".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
                                          //               onTap: () async{
                                          //                 if (await canLaunch(data20191[index]["movies"][inde]["media"].toString())) {
                                          //                 await launch(data20191[index]["movies"][inde]["media"].toString());
                                          //                 } else {
                                          //                 throw 'Could not launch $data20191[index]["movies"][inde]["media"].toString()';
                                          //                 }
                                          //
                                          //               },
                                          //               )
                                          //
                                          //             ],
                                          //           ),
                                          //         ),
                                          //         actions: <Widget>[
                                          //           new TextButton(
                                          //               child: const Text('CANCEL',style: TextStyle(color: Colors.white),),
                                          //               onPressed: () {
                                          //                 Navigator.pop(context);
                                          //               }),
                                          //
                                          //         ],
                                          //       );
                                          //     },
                                          //     transitionBuilder: (context, anim1,anim2, child){
                                          //       return SlideTransition(
                                          //         position: Tween(begin: Offset(0, _fromTop ? -1 : 1), end: Offset(0, 0)).animate(anim1),
                                          //         child: child,
                                          //       );
                                          //     }
                                          // );

                                          // Navigator.push(contex, MaterialPageRoute(builder: (contex) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppScaffold(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => Better(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                        },
                                        child: Container(
                                          height: 180,
                                          width: MediaQuery.of(context).size.width *
                                              .2,
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 8.0),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl: data20191[index]["movies"]
                                              [inde]["banner"]
                                                  .toString(),
                                              progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                                  Center(
                                                    child: spinkit,
                                                  ),
                                              errorWidget: (context, url, error) =>
                                                  Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: 20,),
              ],
            ),

          );
        }



    }

  }
}



class MovieDialog extends StatefulWidget {
  var image,name,url,Cat_id,id,data;
  MovieDialog({this.image,this.name,this.url,this.Cat_id,this.id,this.data});
  @override
  _MovieDialogState createState() => _MovieDialogState(image,name,url,Cat_id,id,data);
}

class _MovieDialogState extends State<MovieDialog> {
  _MovieDialogState(image, name, url, cat_id, id, data);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var s=widget.name;

    if(ipInOrList==true){
      return Scaffold(
        body: Container(
          color: Colors.black,
          child: Row(

            children: [



              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.network(widget.image.toString(),height: size.height/3,),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Container(
                      child: Text('''$s''',
                        maxLines: 1,
                        style: TextStyle(fontSize: size.width/25,color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,),
                    ),
                    RaisedButton(onPressed: (){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Playvideo(name: widget.name,
                        url: widget.url.toString(), Cat_id: widget.Cat_id, id: widget.id, data: widget.data,)));
                    },
                      color: Colors.white,

                      child: Container(
                        width: size.width/3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Icon(Icons.play_arrow),
                            Text("Play",style: TextStyle(fontSize: size.width/20),),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: ()async{
                        if (await canLaunch(widget.url.toString())) {
                          await launch(widget.url.toString());
                        } else {
                          throw 'Could not launch ';
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.arrow_downward_rounded,color: Colors.white,),
                          Text("Download",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel,color: Colors.white,size: size.width/15,))),


            ],
          ),
        ),

      );
    }else{
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      child: Text('''You Are Not Client of Circle Network''',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: size.width/20,color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text('''If you want to become our user please contact our help line''',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontSize: size.width/20,color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,),
                    ),
                    SizedBox(height: 10,),
                    RaisedButton(child: Text("Contact here",style: TextStyle(fontSize: 25,color: Colors.white)),onPressed: (){
                      launch("tel:+09611800900");
                    },shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                      color: Colors.red,),

                  ],
                ),
              ),
              Container(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel,color: Colors.white,size: size.width/15,))),
            ],
          ),
        ),
      );
    }

  }
}
