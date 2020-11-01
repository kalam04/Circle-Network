import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  call(){
    launch("tel:+8801931366893");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.call();
    //debugPrint("frist");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(

        ));
  }
}
