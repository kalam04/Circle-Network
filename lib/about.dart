import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainDrawer.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(title: SafeArea(child: new Text('About')),centerTitle: true,),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,

          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Welcome to Circle",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  alignment: Alignment.center,
                ),
                Container(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text('''Circle Network Limited (CNL) is one of the leading Nationwide ISP in Bangladesh. Circle Network providing best quality Bandwidth in all over the country with prosper and goodwill. There are 37 District and 250 Upozila in our Coverage area. We have GGC server, Facebook server and much more useful content with Bangladesh Largest FTP server with huge content including IP TV for customer satisfaction. Our highly qualified experience and hardworking largest support team working for marvelous support and showing their dedication to work. So you are also invited to our circle family to be the honorable and pioneer client of Circle Network.
                  ''',
                    style: TextStyle(fontSize: 25),),
                )

              ],


            ),
          ),
        ),
      ),

      drawer: SafeArea(child: mainDrawer()),
    );
  }
}