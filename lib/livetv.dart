import 'package:flutter/material.dart';
import 'bkashPayment.dart';
import 'help.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';

class LiveTv extends StatefulWidget {
  @override
  _LiveTvState createState() => _LiveTvState();
}

class _LiveTvState extends State<LiveTv> {
  int _currentIndex=0;
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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("dkfjdk"),
        ),
      ),

    );
  }
}
