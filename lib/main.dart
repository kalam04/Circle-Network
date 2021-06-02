import 'dart:async';
import 'dart:convert';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:circle_network/mainDrawer.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bkashPayment.dart';
import 'call.dart';
import 'home.dart';
import 'package.dart';
import 'package:permission_handler/permission_handler.dart';



Future<void> main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  await Permission.storage.request();
  //Lock Orientation
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);

  runApp(splash());

}

class splash extends StatefulWidget{

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: MaterialApp(
        theme: ThemeData(
          focusColor: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splashIconSize: 300,
          backgroundColor: Colors.grey[200],
          splash: Container(
            //height: 1000,
              child: Image.asset("assets/images/logo.png")
          ),
          nextScreen: Home(),
          duration: 3000,
        ),
      ),
    );
  }
}
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MybottomnavigationBar(),
//     );
//   }
// }
//
// class MybottomnavigationBar extends StatefulWidget {
//   @override
//   _MybottomnavigationBarState createState() => _MybottomnavigationBarState();
// }
//
// class _MybottomnavigationBarState extends State<MybottomnavigationBar> {
//   var data,data_address;
//   var _currentIndex=1;
//
//
//   //
//   // Future getvalue()async{
//   //   var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
//   //   setState(() {
//   //     var decode=json.decode(response.body);
//   //     data=decode;
//   //     //print(widget.a);
//   //     //debugPrint('x=$x');
//   //
//   //   });
//   // }
//   //
//   // Future getvalueAdress()async{
//   //   var response= await http.get("http://circleapp-backend.herokuapp.com/office-address?");
//   //   setState(() {
//   //     var decode=json.decode(response.body);
//   //     data_address=decode;
//   //     //print(widget.a);
//   //     //debugPrint('x=$x');
//   //
//   //   });
//   // }
//
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // this.getvalue();
//     // this.getvalueAdress();
//     //print(data);
//   }
//
//   GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//
//   Future<bool> _willPopCallback() async {
//
//     bool canNavigate = await _navigatorKey.currentState.maybePop(context);
//     print(canNavigate);
//     if (canNavigate) {
//       print("come");
//       _navigatorKey.currentState.maybePop(context);
//       return false;
//     } else {
//       print("come");
//       return true;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context ) {
//
//     return CustomScaffold(
//       scaffold: Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home', backgroundColor: Color(0xffFF7F50),),
//             BottomNavigationBarItem(icon: new Icon(Icons.call), label: 'Call Now',backgroundColor: Colors.blueAccent,),
//             BottomNavigationBarItem(icon: Icon(Icons.camera),label: 'Package',backgroundColor: Colors.lightGreen),
//             BottomNavigationBarItem(icon: Icon(Icons.payment),label: 'Payment',backgroundColor: Colors.deepPurpleAccent),
//           ],
//         ),
//       ),
//       children: <Widget>[
//         Home(),
//         Call(),
//         Packages(),
//         bkashPayment(),
//       ],
//
//
//     );
//   }
// }


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("fgkfdl"),),
      body: Center(
        child: Text("dsf;sdlfk"),
      ),
      drawer: mainDrawer(),

    );
  }
}

//
//
//



//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Shortcuts(
//       shortcuts: {
//         LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
//       },
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: VideoPlayerScreen(
//             url:
//             'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
//       ),
//     );
//   }
// }
//
// class VideoPlayerScreen extends StatefulWidget {
//   VideoPlayerScreen({Key key, this.url}) : super(key: key);
//
//   final String url;
//
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;
//
//   // final FocusNode _focusNode = FocusNode();
//
//   var _playBackPosition = 0;
//   var _videoLength = '';
//   var _playBackFomattedPosition = '';
//   bool _controls = false;
//
//   @override
//   void initState() {
//     _controller = VideoPlayerController.network(
//       widget.url,
//     );
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     _controls = true;
//
//     _controller.play();
//
//     Future.delayed(const Duration(seconds: 5), () {
//       _controls = false;
//     });
//
//     _controller.addListener(() {
//       var minutesTotal = (_controller.value.duration.inSeconds ~/ 60)
//           .toString()
//           .padLeft(1, '0');
//       var secondsTotal = (_controller.value.duration.inSeconds % 60)
//           .toString()
//           .padLeft(2, '0');
//       _videoLength = "$minutesTotal:$secondsTotal";
//
//       _playBackPosition = _controller.value.position.inSeconds;
//       var minutes = (_playBackPosition ~/ 60).toString().padLeft(1, '0');
//       var seconds = (_playBackPosition % 60).toString().padLeft(2, '0');
//       setState(() {
//         _playBackPosition = _playBackPosition;
//         _playBackFomattedPosition = "$minutes:$seconds / $_videoLength";
//       });
//     });
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void controls() {
//     setState(() {
//       _controls = true;
//       Future.delayed(const Duration(seconds: 5), () {
//         _controls = false;
//       });
//     });
//   }
//
//   // _handleKeyEvent(RawKeyEvent event) {
//   //   setState(() {
//   //     if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
//   //         event.logicalKey == LogicalKeyboardKey.arrowRight ||
//   //         event.logicalKey == LogicalKeyboardKey.arrowDown ||
//   //         event.logicalKey == LogicalKeyboardKey.arrowUp) {
//   //       controls();
//   //     }
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   // RawKeyboardListener(
//                   //   focusNode: _focusNode,
//                   //   onKey: (RawKeyEvent event){
//                   //     if(!_controls) {
//                   //       _handleKeyEvent(event);
//                   //     }
//                   //   },
//                   //   child: VideoPlayer(_controller),
//                   // ),
//                   VideoPlayer(_controller),
//                   // AnimatedSwitcher(
//                   //   duration: Duration(milliseconds: 500),
//                   //   reverseDuration: Duration(milliseconds: 500),
//                   //   child: _controls
//                   //       ? Positioned(
//                   //     bottom: 0,
//                   //     child: Container(
//                   //       height: 120,
//                   //       color: Colors.black54,
//                   //     ),
//                   //   )
//                   //       : null,
//                   // ),
//                   Positioned(
//                     bottom: 50.0,
//                     left: 20.0,
//                     child: Center(
//                       child: Text(
//                         '$_playBackFomattedPosition',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Positioned(
//                   //   bottom: 50.0,
//                   //   right: 160.0,
//                   //   child: RawMaterialButton(
//                   //     shape: CircleBorder(),
//                   //     padding: const EdgeInsets.all(10.0),
//                   //     focusColor: Colors.grey[600],
//                   //     fillColor: Colors.black,
//                   //     // autofocus: true,
//                   //     child: Icon(
//                   //       _controller.value.isPlaying
//                   //           ? Icons.pause
//                   //           : Icons.play_arrow,
//                   //       size: 28,
//                   //       color: Colors.white,
//                   //     ),
//                   //     onPressed: () {
//                   //       setState(() {
//                   //         if (_controller.value.isPlaying) {
//                   //           controls();
//                   //           _controller.pause();
//                   //         } else {
//                   //           _controller.play();
//                   //         }
//                   //       });
//                   //     },
//                   //   ),
//                   // ),
//                   // Positioned(
//                   //   bottom: 50.0,
//                   //   right: 80.0,
//                   //   child: RawMaterialButton(
//                   //     shape: CircleBorder(),
//                   //     padding: const EdgeInsets.all(10.0),
//                   //     focusColor: Colors.grey[600],
//                   //     fillColor: Colors.black,
//                   //     child: Icon(
//                   //       Icons.arrow_left,
//                   //       size: 28,
//                   //       color: Colors.white,
//                   //     ),
//                   //     onPressed: () {
//                   //       controls();
//                   //       _controller
//                   //           .seekTo(Duration(seconds: _playBackPosition - 10));
//                   //     },
//                   //   ),
//                   // ),
//                   // Positioned(
//                   //   bottom: 50.0,
//                   //   right: 0.0,
//                   //   child: RawMaterialButton(
//                   //     shape: CircleBorder(),
//                   //     padding: const EdgeInsets.all(10.0),
//                   //     focusColor: Colors.grey[600],
//                   //     fillColor: Colors.black,
//                   //     child: Icon(
//                   //       Icons.arrow_right,
//                   //       size: 28,
//                   //       color: Colors.white,
//                   //     ),
//                   //     onPressed: () {
//                   //       controls();
//                   //       _controller
//                   //           .seekTo(Duration(seconds: _playBackPosition + 10));
//                   //     },
//                   //   ),
//                   // ),
//                   Positioned(
//                     bottom: 5.0,
//                     left: 20.0,
//                     right: 20.0,
//                     child: Slider(
//                       activeColor: Colors.red[900],
//                       value: _playBackPosition.toDouble(),
//                       min: 0,
//                       max: _controller.value.duration.inSeconds.toDouble(),
//                       onChanged: (v) {
//                         controls();
//                         _controller.seekTo(Duration(seconds: v.toInt()));
//                       },
//                     ),
//                   ),
//                   VideoProgressIndicator(_controller, allowScrubbing: true),
//                 ],
//               ),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
