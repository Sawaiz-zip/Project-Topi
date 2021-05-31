import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:test_app/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Tabs/hometab.dart';
import 'package:test_app/Tabs/posttab.dart';
import 'package:test_app/Tabs/profile_tab.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int current_index=0;
  List<Widget> children=[
    HomeTab(),
    PostTab(),
    ProfileTab(),
  ];
// ignore: non_constant_identifier_names
void OnTappedBar(int index)
{
  setState(() {
    current_index=index;
  });
}
FirebaseAuth _auth = FirebaseAuth.instance;
User user;
bool isloggedin= false;

getUser()async
{
  User firebaseUser = _auth.currentUser;
  await firebaseUser?.reload();
  firebaseUser = _auth.currentUser;
  if(firebaseUser!=null)
    {
      setState(() {
        this.user=firebaseUser;
        this.isloggedin=true;
      });
    }
}
checkauthentication()async
{
  _auth.authStateChanges().listen((user) {

    if(user==null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
      }
  });

}
@override
  // ignore: must_call_super
  void initState() {
   this.checkauthentication();
   this.getUser();

  }
  @override
  Widget build(BuildContext context) {
    Size _size =MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop:()async=>false,
      child: Scaffold(


             bottomNavigationBar:  BottomNavigationBar(
                onTap: OnTappedBar,
                currentIndex: current_index,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home,color: Colors.green,),
                    // ignore: deprecated_member_use
                    title: Text('Home',style: TextStyle(color: Colors.green)),

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_box,color: Colors.green,),
                    // ignore: deprecated_member_use
                    title: Text('Post',style: TextStyle(color: Colors.green)),

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person,color: Colors.green,),
                    // ignore: deprecated_member_use
                    title: Text('Profile',style: TextStyle(color: Colors.green)),

                  )
                ],
              ),
      body:  !isloggedin? CircularProgressIndicator():
      children[current_index],


          ),);


  }
}


