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

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

int index;

class _HomeDrawerState extends State<HomeDrawer> {
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
    return show
        ? Drawer(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.green,
                  child: Center(
                    child: Column(children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(20),
                        child: Row(children: [
                          // imagelink!=null?

                          CircleAvatar(
                            radius: 50,
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
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            info['lname']  ,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        info['Email'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ]),
                  ),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.dollarSign),
                  title: Text('Bank Details'),
                  onTap: null,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: null,
                ),
                ListTile(
                    leading: Icon(Icons.login_outlined),
                    title: Text('Log out'),
                    onTap: () {
                      Signout();
                      //
                    }),
              ],
            ),
          )
        : CircularProgressIndicator();

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
          info = {'Email': key['Email'], 'imageUrl': key['Image url'],'fname':key['First name'],'lname':key['last name']};
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

  Signout() async {
    _auth.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
