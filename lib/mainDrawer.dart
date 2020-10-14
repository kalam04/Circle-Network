import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'livetv.dart';
import 'package.dart';

class mainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,

                    decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/images/cn.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Text("Circle Network"),
                ],

              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Support"),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text("Packages"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => package()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_ind),
              title: Text("About"),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact"),
              onTap: null,
            ),
          ],
        )
    );

  }

}