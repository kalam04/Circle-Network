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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Search.dart';
import 'VlcPlayer.dart';
import 'flickVideoPlayer.dart';

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

  Future getvalue() async {
    var respons20191 = await http.get(
      "http://circleftp.net/category_by_post/",
    );

    setState(() {
      var decode20191 = json.decode(respons20191.body);

      data20191 = decode20191;
      print(decode20191);

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



  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow[200] : Colors.grey,
        ),
      );
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getvalue();
    this._deleteCacheDir();
    this._deleteAppDir();

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

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: MediaQuery.of(context).orientation == Orientation.landscape
            ? null
            : AppBar(
                title: Text("Movies"),
                centerTitle: true,
                backgroundColor: Colors.black,
              ),
        body: ListView(
          children: [
            Container(
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

                                      showGeneralDialog(
                                          barrierLabel: "Label",
                                          barrierDismissible: true,
                                          // barrierColor: Colors.black,
                                          transitionDuration: Duration(milliseconds: 700),
                                          context: context,
                                          pageBuilder: (context, anmi1, anime2){

                                            return AlertDialog(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16)
                                              ),
                                              elevation: 0,
                                              title: new Text("Choose Player",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),

                                              content: Container(
                                                color: Colors.black,
                                                width: size.width,
                                                child: new ListView(
                                                  shrinkWrap: true,
                                                  // height: 350,
                                                  children: <Widget>[
                                                    InkWell(
                                                        onTap: (){
                                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAppScaffold(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                                        },
                                                        child: Text("Play With VLC Player".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
                                                    SizedBox(height: 20,),
                                                    InkWell(onTap: (){
                                                      Navigator.pushReplacement(contex, MaterialPageRoute(builder: (contex) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                                      },
                                                        child: Text("Play With Other Player".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
                                                    SizedBox(height: 20,),
                                                    InkWell(child: Text("Download".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),),
                                                      onTap: () async{
                                                        if (await canLaunch(data20191[index]["movies"][inde]["media"].toString())) {
                                                          await launch(data20191[index]["movies"][inde]["media"].toString());
                                                        } else {
                                                          throw 'Could not launch $data20191[index]["movies"][inde]["media"].toString()';
                                                        }


                                                      },
                                                    )

                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                new TextButton(
                                                    child: const Text('CANCEL',style: TextStyle(color: Colors.white),),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }),

                                              ],
                                            );
                                          },
                                          transitionBuilder: (context, anim1,anim2, child){
                                            return SlideTransition(
                                              position: Tween(begin: Offset(0, _fromTop ? -1 : 1), end: Offset(0, 0)).animate(anim1),
                                              child: child,
                                            );
                                          }
                                      );


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
                                    },
                                    child: Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width *
                                          .4,
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
    }else{
      return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Container(
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

                                            return AlertDialog(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16)
                                              ),
                                              elevation: 0,
                                              title: new Text("Choose Player",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),

                                              content: Container(
                                                color: Colors.black,
                                                width: size.width,
                                                child: new ListView(
                                                  shrinkWrap: true,
                                                  // height: 350,
                                                  children: <Widget>[
                                                    InkWell(
                                                        onTap: (){
                                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAppScaffold(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                                        },
                                                        child: Text("Play With VLC Player".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
                                                    SizedBox(height: 20,),
                                                    InkWell(onTap: (){
                                                      Navigator.pushReplacement(contex, MaterialPageRoute(builder: (contex) => Playvideo(name: data20191[index]["movies"][inde]["name"].toString(), url: data20191[index]["movies"][inde]["media"].toString(), Cat_id: index, id: inde, data: data20191,)));
                                                    },child: Text("Play With Other Player".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
                                                    SizedBox(height: 20,),
                                                    InkWell(child: Text("Download".toUpperCase(),style: TextStyle(fontSize: size.height/45,color: Colors.white),),
                                                    onTap: () async{
                                                      if (await canLaunch(data20191[index]["movies"][inde]["media"].toString())) {
                                                      await launch(data20191[index]["movies"][inde]["media"].toString());
                                                      } else {
                                                      throw 'Could not launch $data20191[index]["movies"][inde]["media"].toString()';
                                                      }

                                                    },
                                                    )

                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                new TextButton(
                                                    child: const Text('CANCEL',style: TextStyle(color: Colors.white),),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }),

                                              ],
                                            );
                                          },
                                          transitionBuilder: (context, anim1,anim2, child){
                                            return SlideTransition(
                                              position: Tween(begin: Offset(0, _fromTop ? -1 : 1), end: Offset(0, 0)).animate(anim1),
                                              child: child,
                                            );
                                          }
                                      );

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