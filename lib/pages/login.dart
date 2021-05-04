import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          //alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: 683,
              width: 460,
              color: Colors.white,
              child: Stack(
                  fit: StackFit.loose,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      top: 20,
                      right: 10,
                      left: 10,
                      bottom: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('imageAsset/projtopi.jpg.jpg'),
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.dstATop)),
                        ),
                      ),
                    ),
                    Container(
                      child: SafeArea(
                        child: FlatButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            FontAwesomeIcons.arrowLeft,

                            //color: ColorFilter.mode(Colors.black.withOpacity(0.3),BlendMode.dstATop)
                          ),
                          label: Text(''),
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter email',
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Password',
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.green,
                            splashColor: Colors.lightGreen,
                            padding: EdgeInsets.only(left: 100, right: 100),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 900),
                              child: Text(' LOGIN '),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'tabs');
                            },
                          ),
                        ]),
                  ]),
            )
          ]),
    );
  }
}
