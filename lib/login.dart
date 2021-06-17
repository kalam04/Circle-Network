import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Animation/FadeAnimation.dart';
import 'components/already_have_an_account_acheck.dart';


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var result;
  var id,password;

  final idController = TextEditingController();

  final passwordController=TextEditingController();

  Future User_Login( id, pass) async {
    // print(id+pass);

    var url='http://radius.yetfix.com/api/getCustomerInfo';
    var respons = await http.post(Uri.parse(url.toString()),body: {
      "userid": id,
      "password": pass,
    });
    // print(respons.statusCode);
    setState(() {
      result = json.decode(respons.body);
      if(result=="Nothing Found"){
        // Fluttertoast.showToast(
        //     msg: "User Id and Password Not match",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
      }else{
        print(result);

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height*.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: size.width/25,
                        width: size.width/4,
                        height: size.height/4,
                        child: FadeAnimation(3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: size.width/3,
                        width: size.width/4,
                        height: size.height/5,
                        child: FadeAnimation(4, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: size.width/10,
                        top: size.height/20,
                        width: size.width/5,
                        height: size.height/5,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(5, Container(
                          margin: EdgeInsets.only(top: size.height/30),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: size.width/10, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.height/30),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0,5,0,5),
                              child: TextFormField(
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Id';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    id = value;
                                  });

                                },
                                onChanged: (text){
                                  id=text;
                                },
                                controller: idController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(color: Colors.transparent)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(color: Colors.lightGreenAccent)
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Enter Your Id",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),

                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: TextFormField(
                                onSaved: (String value) {
                                  setState(() {
                                    password = value;
                                  });

                                },
                                onChanged: (text){
                                  password=text;
                                },
                                obscureText: false,

                                controller: passwordController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(color: Colors.transparent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(color: Colors.lightGreenAccent)),
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Enter Your Password",
                                  filled: true,
                                  fillColor: Colors.grey[200],

                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: size.height/20,),
                      FadeAnimation(2, InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(143, 100, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                              )
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        onTap: () async{
                          print(password+"   "+id);


                        },
                      )),
                      SizedBox(height: 70,),
                      // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
