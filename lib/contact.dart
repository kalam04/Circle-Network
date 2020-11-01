import 'package:circle_network/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    final appBar=AppBar(
      title: SafeArea(child: Text('Contacts')),
      backgroundColor: Colors.cyan,
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            child: Column(
              children: [
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Contact Head ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),

                      ),
                      Container(
                        child: Text('''60/2,1glooIs Dream(2nd floor), Purana Paltan, Dhaka-1100''',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),

                      ),

                      Container(
                        child: Text("Support: 01944455072",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),

                      ),
                      Container(
                        child: Text("Sales Contact:01944455043, 01944455034",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),

                      ),

                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Contact Corporate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),

                      ),
                      Container(
                        child: Text('''Unity trade Center 3rd Floor Pollibiddut Bus Stand Nabinagar,Ashulia, Savar,Dhaka-1344''',textAlign: TextAlign.center,style: TextStyle(fontSize: 19,),),

                      ),

                      Container(
                        child: Text("Support: 01944455065",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),

                      ),
                      Container(
                        child: Text("Sales Contact: 01944455012 01944455003",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),

                      ),

                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Contact Uttara",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),

                      ),
                      Container(
                        child: Text('''Hosue:-35,Sonargaon jonopath, Sector-7,Uttara''',textAlign: TextAlign.center,style: TextStyle(fontSize: 19,),),
                      ),
                      Container(
                        child: Text('''Support: 01944455022''',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),

                      ),

                      Container(
                        child: Text("Sales Contact: 01944455012 01944455003",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),
                      ),

                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Contact Joydevpur",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                      ),
                      Container(
                        child: Text('''60/2,1glooIs Dream, Purana Paltan, Dhaka-1100''',textAlign: TextAlign.center,style: TextStyle(fontSize: 19,),),
                      ),
                      Container(
                        child: Text('''Support: 01944455072''',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: mainDrawer(),


    );
  }
}