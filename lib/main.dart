import 'package:flutter/material.dart';
import 'package:test_app/pages/Tabs.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/pages/login.dart';
import 'package:test_app/pages/Register.dart';

void main() => runApp(MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'login': (context) => Login(),
        'register': (context) => Register(),
        'tabs': (context) => Tabs(),
      },
    ));

// Container(

// Container(
//   child: Text('box2'),
//   color: Colors.blue,
//   padding: EdgeInsets.all(20),
// ),
// Container(
//   child: Text('box3'),
//   color: Colors.red,
//   padding: EdgeInsets.all(30),
// )

// FloatingActionButton(
//   child: Text('donate'),
//   backgroundColor: Colors.yellow[900],
// )
//
//  child: Text('box1'),
//  color: Colors.yellow,
//  padding: EdgeInsets.all(10),

// RaisedButton.icon(
//
// onPressed:() {},
// icon:Icon(
// Icons.login_sharp
// ),
// label: Text(
// 'login asd',
// style: TextStyle(
// fontSize: 20,

// Image.asset(
//   'imageAsset/projtopi.jpg',
//   height: 250,
//   width: 500,
//   colorBlendMode: BlendMode.exclusion,
//
// ),

// child:Text(
// 'Donate ',
// style: TextStyle(
// fontSize: 50,
// fontWeight: FontWeight.bold,
// letterSpacing: 2,
// color: Colors.blue[900],
// fontFamily: 'dancingscript',
// ),
// ),
