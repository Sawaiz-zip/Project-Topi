import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/pages/authentication/Register.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}
int index;

class _ProfileTabState extends State<ProfileTab> {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Map info;
  bool show = false;
  String imagelink;

  @override
  void initState() {
    super.initState();
    this.readData();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(

body: show? Column(
  children: [
    
    Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Colors.green,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

          Container(
            width: _size.width,
            height: 250,
            //margin: EdgeInsets.all(100),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [

              // imagelink!=null?

              CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(info['imageUrl']),


              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                info['fname']  ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                info['lname']  ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),

        ]),

      ),

    ),
    SizedBox(
      height: 50,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
          'Email: ',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            info['Email'],
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Blood Type:  ',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            info['blood type'],
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Phone Number: ',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            info['phone number'],
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
    
  ],
): CircularProgressIndicator(),
    );
  }
  Future readData() async{
    setState(() {
      show = false;
    });
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      Map values = dataSnapshot.value["DataBase"];

      for (var key in values.values) {
        if (key['Email'] == _auth.currentUser.email) {
          info = {'Email': key['Email'], 'imageUrl': key['Image url'],'fname':key['First name'],'lname':key['last name'],'blood type':key['blood type'],'phone number':key['phone number']};
          print(info);
          setState(() {
            show = true;

          });

          print('imaaaaaaaaaaaaaaaageeeeeeeeeeee=====>>$imagelink');
          break;

        }
      }
    });
  }


}
