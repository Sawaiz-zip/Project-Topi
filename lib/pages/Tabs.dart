import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:wasm';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[current_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: OnTappedBar,
        currentIndex: current_index,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          // ignore: deprecated_member_use
          title: Text('Home'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            // ignore: deprecated_member_use
            title: Text('Post'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text('Profile'),

          )
        ],
      ),

    );
  }
}


