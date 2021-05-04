import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(

        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Colors.green,




            child: Center(
              child: Column(
                  children: [
              Container(
                width: 100,
              height: 100,
              margin:EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('imageAsset/image.jpg'),
              fit: BoxFit.fitWidth,
          ),
      ),
              ),
                    Text('Sawaiz Naveed',
                    style: TextStyle(color: Colors.white,
                      fontSize:20,

                    ),
                    ),
                    Text('Sawaiz@topi.com',
                      style: TextStyle(color: Colors.white,
                        fontSize:10,

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
            onTap:(){
            Navigator.popUntil(context, (home) => false);
            }

          ),
        ],
      ),
    );
  }
}
