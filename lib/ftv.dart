//
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'mainDrawer.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:async';
//
// import 'bkashPayment.dart';
// import 'home.dart';
// import 'package.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/services.dart';
//
// class FTV extends StatefulWidget {
//   @override
//   _FTVState createState() => _FTVState();
// }
//
// class _FTVState extends State<FTV> {
//   final Completer<InAppWebViewController> _controller = Completer<InAppWebViewController>();
//
//   Future<bool> _willPopCallback() async {
//     InAppWebViewController webViewController = await _controller.future;
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
//   int currentIndex = 0;
//
//   setBottomBarIndex(index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     var w=MediaQuery.of(context).size.width;
//     var x=MediaQuery.of(context).size.height;
//     Size size = MediaQuery.of(context).size;
//
//     if (MediaQuery.of(context).orientation == Orientation.portrait) {
//       return WillPopScope(
//         onWillPop: _willPopCallback,
//         child: Scaffold(
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(size.height/15),
//             child: new AppBar(title: Text('FTP Server', style: TextStyle(fontSize: x / 30),),
//               centerTitle: true,
//               leadingWidth: 30,
//               backgroundColor: Color(0xffFF7F50),),
//           ),
//           body: Stack(
//             children: [
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Container(
//                   color: Color(0xffFF7F50),
//                   width: size.width,
//                   height: size.height/15,
//                   child: Stack(
//                     overflow: Overflow.visible,
//                     children: [
//                       // CustomPaint(
//                       //   size: Size(size.width, 80),
//                       //   painter: BNBCustomPainter(),
//                       // ),
//                       // Center(
//                       //   heightFactor: 0.6,
//                       //   child: FloatingActionButton(backgroundColor: Colors.orange, child: Icon(Icons.shopping_basket), elevation: 0.1,
//                       //       onPressed: () {}),
//                       // ),
//                       Container(
//                         width: size.width,
//                         height: size.height/15,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 Icons.home,
//                                 color: currentIndex == 0
//                                     ? Colors.orange
//                                     : Colors.white,
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Home()),
//                                 );
//                               },
//                               splashColor: Colors.white,
//                             ),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.call,
//                                   color: currentIndex == 1
//                                       ? Colors.orange
//                                       : Colors.white,
//                                 ),
//                                 onPressed: () {
//
//                                   launch("tel:+09611800900");
//
//                                 }),
//                             // Container(
//                             //   width: size.width * 0.20,
//                             // ),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.camera,
//                                   color: currentIndex == 2
//                                       ? Colors.orange
//                                       : Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
//                                 }),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.payment,
//                                   color: currentIndex == 3
//                                       ? Colors.orange
//                                       : Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
//                                 }),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 height: size.height-(size.height/15+size.height/15
//                     +MediaQuery.of(context).padding.top),
//                 width: size.width,
//                 child: Container(
//                   child: SafeArea(
//                     child: InAppWebView(
//                       initialUrl: "http://circleftp.net/",
//                       initialHeaders: {},
//                       initialOptions: InAppWebViewGroupOptions(
//                         crossPlatform: InAppWebViewOptions(
//                             debuggingEnabled: true,
//                             useOnDownloadStart: true
//                         ),
//                       ),
//                       onWebViewCreated: (InAppWebViewController webViewController) {
//                         _controller.complete(webViewController);
//                       },
//                       onLoadStart: (InAppWebViewController controller, String url) {},
//                       onLoadStop: (InAppWebViewController controller, String url) {},
//                       onDownloadStart: (controller, url) async {
//                         if (await canLaunch(url)) {
//                           await launch(url);
//                         } else {
//                           throw 'Could not launch $url';
//                         }
//                         // print("onDownloadStart $url");
//                         // final taskId = await FlutterDownloader.enqueue(
//                         //
//                         //   url: url,
//                         //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
//                         //       ExtStorage.DIRECTORY_DOWNLOADS),
//                         //   //savedDir: (await getExternalStorageDirectory()).path,
//                         //   showNotification: true, // show download progress in status bar (for Android)
//                         //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//                         // );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           drawer: SafeArea(child: mainDrawer()),
//
//
//         ),
//       );
//     }else{
//       setState(() {
//         SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//       });
//       return WillPopScope(
//         onWillPop: _willPopCallback,
//         child: Scaffold(
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(size.height/9),
//             child: new AppBar(title: Text('FTP Server', style: TextStyle(fontSize: w / 30),),
//               centerTitle: true,
//               leadingWidth: 30,
//               backgroundColor: Color(0xffFF7F50),),
//           ),
//           body: Stack(
//             children: [
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Container(
//                   color: Color(0xffFF7F50),
//                   width: size.width,
//                   height: size.height/9,
//                   child: Stack(
//                     overflow: Overflow.visible,
//                     children: [
//                       // CustomPaint(
//                       //   size: Size(size.width, 80),
//                       //   painter: BNBCustomPainter(),
//                       // ),
//                       // Center(
//                       //   heightFactor: 0.6,
//                       //   child: FloatingActionButton(backgroundColor: Colors.orange, child: Icon(Icons.shopping_basket), elevation: 0.1,
//                       //       onPressed: () {}),
//                       // ),
//                       Container(
//                         width: size.width,
//                         height: size.height/9,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 Icons.home,
//                                 color: currentIndex == 0
//                                     ? Colors.orange
//                                     : Colors.white,
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Home()),
//                                 );
//                               },
//                               splashColor: Colors.white,
//                             ),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.call,
//                                   color: currentIndex == 1
//                                       ? Colors.orange
//                                       : Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   launch("tel:+09611800900");
//                                 }),
//                             // Container(
//                             //   width: size.width * 0.20,
//                             // ),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.camera,
//                                   color: currentIndex == 2
//                                       ? Colors.orange
//                                       : Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
//                                 }),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.payment,
//                                   color: currentIndex == 3
//                                       ? Colors.orange
//                                       : Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
//                                 }),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 height: size.height-(size.height/9+size.height/9),
//                 width: size.width,
//                 child: Container(
//                   child: SafeArea(
//                     child: InAppWebView(
//                       initialUrl: "http://ftp4.circleftp.net/",
//                       initialHeaders: {},
//                       initialOptions: InAppWebViewGroupOptions(
//                         crossPlatform: InAppWebViewOptions(
//                             debuggingEnabled: true,
//                             useOnDownloadStart: true
//                         ),
//                       ),
//                       onWebViewCreated: (InAppWebViewController webViewController) {
//                         _controller.complete(webViewController);
//                       },
//                       onLoadStart: (InAppWebViewController controller, String url) {},
//                       onLoadStop: (InAppWebViewController controller, String url) {},
//                       onDownloadStart: (controller, url) async {
//                         if (await canLaunch(url)) {
//                           await launch(url);
//                         } else {
//                           throw 'Could not launch $url';
//                         }
//                         // print("onDownloadStart $url");
//                         // final taskId = await FlutterDownloader.enqueue(
//                         //
//                         //   url: url,
//                         //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
//                         //       ExtStorage.DIRECTORY_DOWNLOADS),
//                         //   //savedDir: (await getExternalStorageDirectory()).path,
//                         //   showNotification: true, // show download progress in status bar (for Android)
//                         //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//                         // );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           drawer: SafeArea(child: mainDrawer()),
//
//
//         ),
//       );
//     }
//   }
// }