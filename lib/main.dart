import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bkashPayment.dart';
import 'call.dart';
import 'contact.dart';
import 'mainDrawer.dart';
import 'home.dart';
import 'package.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:url_launcher/url_launcher.dart';



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
        backgroundColor: Colors.blue[200],
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

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(

      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: new Icon(Icons.home), title: Text('Home'), backgroundColor: Colors.cyanAccent[100],),
            BottomNavigationBarItem(icon: InkWell(child: new Icon(Icons.call),onTap: (){
              launch("tel:+8801931366893");
            },), title: InkWell(child: Text('Call Now'),onTap: (){

            },),backgroundColor: Colors.blueAccent,),
            BottomNavigationBarItem(icon: new Icon(Icons.camera),title: Text('Package'),backgroundColor: Colors.lightGreen),
            //BottomNavigationBarItem(icon: new Icon(Icons.payment),title: Text('Payment'),backgroundColor: Colors.deepPurpleAccent),

          ],
        ),
      ),
      children: <Widget>[
        Home(),
        Call(),
        Packages(),
        //bkashPayment(),

      ],


    );

  }
}

