import 'package:circle_network/playWevview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mainDrawer.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var x=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    var appBartext1="Facebook";
    var webUrl1="https://www.facebook.com/groups/circlenetworkbd.net";
    var appBartext2="Youtube";
    var webUrl2="https://www.facebook.com/groups/circlenetworkbd.net";

    if(MediaQuery.of(context).orientation==Orientation.portrait){
      return Scaffold(

        appBar: PreferredSize(preferredSize: Size.fromHeight(x/13),child: new AppBar(title: Center(child: new Text('About',style: TextStyle(fontSize: x/30),)),centerTitle: true,)),
        body: SafeArea(

          child: Container(
            //color: Colors.white70,
            height: MediaQuery.of(context).size.height,

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Welcome to Circle Network",style: TextStyle(fontSize: w/10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Image.asset("assets/images/about.jpg"),

                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('''Circle Network Limited (CNL) is one of the leading Nationwide ISP in Bangladesh. Circle Network providing best quality Bandwidth in all over the country with prosper and goodwill. There are 37 District and 250 Upozila in our Coverage area. We have GGC server, Facebook server and much more useful content with Bangladesh Largest FTP server with huge content including IP TV for customer satisfaction.
                    ''',textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: h/38,),),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () async {
                        const url = 'http://yetfix.com/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Design and Develop by : ",
                            style: TextStyle(fontSize: w/20,color: Colors.black,fontFamily: 'Pacifico-Regular'),),
                          Text("YetFix Limited",style: TextStyle(fontSize: w/15, color: Colors.deepOrangeAccent[700],fontFamily: 'Pacifico-Regular'),),
                        ],
                      ),
                    ),

                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: [
                        InkWell(onTap: () async {
                          const url1 = 'https://www.facebook.com/groups/circlenetworkbd.net';
                          if (await canLaunch(url1)) {
                            final bool nativeAppLaunchSucceeded = await launch(
                              url1,
                              forceSafariVC: false,
                              universalLinksOnly: true,
                            );
                            if (!nativeAppLaunchSucceeded) {
                              await launch(url1, forceSafariVC: true);
                            }
                          }
                        },child: Image.asset("assets/images/facebook.png",height: h/15,width: w/8,)),
                        InkWell(onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>WebviewRun(appbartext: appBartext2,urlString: webUrl2,)));
                        },child: Image.asset("assets/images/youtube.png",height: h/15,width: w/9,)),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        drawer: SafeArea(child: mainDrawer()),
      );
    }else{
      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(w/13),child: new AppBar(title: Center(child: new Text('About',style: TextStyle(fontSize: w/30),)),centerTitle: true,)),
        body: SafeArea(

          child: Container(
            //color: Colors.white70,
            height: MediaQuery.of(context).size.height,

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Welcome to Circle Network",style: TextStyle(fontSize: w/20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40,20,40,20.0),
                    child: Container(
                      child: Image.asset("assets/images/about.jpg"),

                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100,20,100,20.0),
                      child: Text('''Circle Network Limited (CNL) is one of the leading Nationwide ISP in Bangladesh. Circle Network providing best quality Bandwidth in all over the country with prosper and goodwill. There are 37 District and 250 Upozila in our Coverage area. We have GGC server, Facebook server and much more useful content with Bangladesh Largest FTP server with huge content including IP TV for customer satisfaction.
                    ''',textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: w/30,),),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () async {
                        const url = 'http://yetfix.com/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Design and Develop by : ",
                            style: TextStyle(fontSize: w/25,color: Colors.black,fontFamily: 'Pacifico-Regular'),),
                          Text("YetFix Limited",style: TextStyle(fontSize: w/20, color: Colors.deepOrangeAccent[700],fontFamily: 'Pacifico-Regular'),),
                        ],
                      ),
                    ),

                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: [
                        InkWell(onTap: () async {
                          const url1 = 'https://www.facebook.com/groups/circlenetworkbd.net';
                          if (await canLaunch(url1)) {
                            final bool nativeAppLaunchSucceeded = await launch(
                              url1,
                              forceSafariVC: false,
                              universalLinksOnly: true,
                            );
                            if (!nativeAppLaunchSucceeded) {
                              await launch(url1, forceSafariVC: true);
                            }
                          }
                          },child: Image.asset("assets/images/facebook.png",height: w/10,width: w/10,)),
                        InkWell(onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>WebviewRun(appbartext: appBartext2,urlString: webUrl2,)));
                          },child: Image.asset("assets/images/youtube.png",height: w/10,width: w/9,)),

                      ],
                    ),
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
}