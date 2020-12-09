import 'dart:async';
import 'dart:convert';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:animated_splash_screen/animated_splash_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 300,
        backgroundColor: Colors.grey[200],
        splash: Container(
          //height: 1000,
            child: Image.asset("assets/images/logo.png")
        ),
        nextScreen: MyApp(),
        duration: 3000,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MybottomnavigationBar(),
    );
  }
}

class MybottomnavigationBar extends StatefulWidget {
  @override
  _MybottomnavigationBarState createState() => _MybottomnavigationBarState();
}

class _MybottomnavigationBarState extends State<MybottomnavigationBar> {
  var data,data_address;
  var _currentIndex=1;



  Future getvalue()async{
    var response= await http.get("http://circleapp-backend.herokuapp.com/packages?");
    setState(() {
      var decode=json.decode(response.body);
      data=decode;
      //print(widget.a);
      //debugPrint('x=$x');

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

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> _willPopCallback() async {

    bool canNavigate = await _navigatorKey.currentState.maybePop(context);
    print(canNavigate);
    if (canNavigate) {
      print("come");
      _navigatorKey.currentState.maybePop(context);
      return false;
    } else {
      print("come");
      return true;
    }
  }


  @override
  Widget build(BuildContext context ) {

    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: new Icon(Icons.home), title: Text('Home'), backgroundColor: Color(0xffFF7F50),),
            BottomNavigationBarItem(icon: new Icon(Icons.call), title: Text('Call Now'),backgroundColor: Colors.blueAccent,),
            BottomNavigationBarItem(icon: Icon(Icons.camera),title: Text('Package'),backgroundColor: Colors.lightGreen),
            BottomNavigationBarItem(icon: Icon(Icons.payment),title: Text('Payment'),backgroundColor: Colors.deepPurpleAccent),
          ],
        ),
      ),
      children: <Widget>[
        Home(data: data,address: data_address,),
        Call(),
        Packages(data: data,),
        bkashPayment(),
      ],


    );
  }
}

