import 'package:flutter/material.dart';
import 'bkashPayment.dart';
import 'contact.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';

class LiveTv extends StatefulWidget {
  @override
  _LiveTvState createState() => _LiveTvState();
}

class _LiveTvState extends State<LiveTv> {

  final appBar=AppBar(
    title: Text('Circle Network'),
    centerTitle: true,
    backgroundColor: Colors.cyan,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SafeArea(child: new Text('Live Tv')),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Live TV'),
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),
    );
  }
}

class LiveTv1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SafeArea(child: new Text('Live Tv')),centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text('Live TV'),
        ),
      ),
      drawer: SafeArea(child: mainDrawer()),
    );
  }
}