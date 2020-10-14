import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bkashPayment.dart';
import 'help.dart';
import 'mainDrawer.dart';
import 'home.dart';
import 'package.dart';
import 'package:custom_navigator/custom_navigator.dart';



void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);

  runApp(splash());
}

class splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/cn.png"),
        nextScreen: MyApp(),
        duration: 1,
      ),
    );
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MybottomnavigationBar(),
    );
  }
}

class MybottomnavigationBar extends StatefulWidget {
  @override
  _MybottomnavigationBarState createState() => _MybottomnavigationBarState();
}



class _MybottomnavigationBarState extends State<MybottomnavigationBar> {
  static int _currentIndex=0;
  final List<Widget> _children =[
    Home(),
    Help(),
    package(),
    bkashPayment(),
  ];
  void onTabBar(int index){
    setState(() {
      _currentIndex=index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(

          items: [
            BottomNavigationBarItem(icon: new Icon(Icons.home), title: Text('Home'), backgroundColor: Colors.orangeAccent,),
            BottomNavigationBarItem(icon: new Icon(Icons.contacts), title: Text('Contacts'),backgroundColor: Colors.blueAccent),
            BottomNavigationBarItem(icon: Icon(Icons.camera),title: Text('Package'),backgroundColor: Colors.lightGreen),
            BottomNavigationBarItem(icon: Icon(Icons.payment),title: Text('Payment'),backgroundColor: Colors.deepPurpleAccent),

          ],
        ),
      ),
      children: <Widget>[
        Home(),
        Help(),
        package(),
        bkashPayment(),


      ],


    );

  }
}

