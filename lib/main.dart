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
import 'login.dart';
import 'package.dart';
import 'package:permission_handler/permission_handler.dart';



Future<void> main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
 // await Permission.storage.request();
  //Lock Orientation
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash()));

}

class splash extends StatefulWidget{

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {


  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    if(MediaQuery.of(context).orientation==Orientation.landscape){
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
    }else{
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
}


