import 'package:flutter/material.dart';
import 'package:test_app/Tabs/homedrawer.dart';
class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Home tab')),

      ),
      drawer:HomeDrawer(),
    );
  }
}
