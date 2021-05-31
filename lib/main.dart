import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Tabs/homedrawer.dart';
import 'file:///D:/flutter%20applications/test_app/lib/Tabs/Tabs.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/pages/authentication/login.dart';
import 'package:test_app/pages/authentication/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/lib/Tabs/homedrawer.dart';
import 'package:test_app/Tabs/sponsorAchild.dart';



void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

 return runApp(MaterialApp(

    initialRoute: 'home',
    routes: {
      'home': (context) => Home(),
      'login': (context) => Login(),
      'register': (context) => Register(),
      'tabs': (context) => Tabs(),
      'sponsorAchild':(context)=>SponsorAchild(),
    },
  ));
}
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
