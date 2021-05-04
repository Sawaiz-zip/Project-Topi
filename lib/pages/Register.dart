import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DateTime selectedDate = DateTime.now();
  String dropdownValue = 'one';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // ignore: non_constant_identifier_names
  String Choose_value = '';
  // ignore: non_constant_identifier_names
  List ListItem = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text(
            'Register',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
      ),
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
                    SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Enter',
                                    labelText: 'First Name',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Enter',
                                    labelText: 'Last Name',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Enter',
                                    labelText: 'Email',
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Enter',
                                    labelText: 'Password',
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Re-enter',
                                    labelText: 'Re-enter',
                                  ),
                                ),
                              ),
                              Row(

                                  children: [
                              Container(

                              padding: const EdgeInsets.only(left: 10,top:10),

                              child:SizedBox(
                                child:Text('Date of birth',
                                style: TextStyle(fontSize: 15),
                                ),
                                height: 20,
                              ),
                              ),
                              ]
                              ),

                              Row(

                                  children: [
                                    Container(

                                      padding: const EdgeInsets.only(bottom: 10),

                                      child: FlatButton(

                                        onPressed: () => _selectDate(context),
                                        child: Text("${selectedDate.toUtc()}".split(' ')[0],
                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),


                                   // Container(

                                     // padding: const EdgeInsets.only(bottom: 10,left: 40,top:10),
                                      //child: Text("${selectedDate.toUtc()}".split(' ')[0],
                                       // style: TextStyle(fontSize: 20,
                                         //
                                        //),
                                      //),

                                  //  ),
                                  ]
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text('Blood Group'),
                                    DropdownButton(
                                      hint: Text('    $Choose_value',
                                      style: TextStyle(fontSize: 14),
                                      ),
                                      icon: Icon(
                                        Icons.arrow_downward,
                                      ),
                                      onChanged: (newvalue) {
                                        setState(() {
                                        //  Text('  click here ');
                                          Choose_value = newvalue;
                                        });
                                      },
                                      items: ListItem.map((valueitem) {
                                        return DropdownMenuItem(
                                            value: valueitem,
                                            child: Text(valueitem));
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Enter',
                                    labelText: 'Phone number',
                                  ),
                                ),
                              ),
                    SizedBox(
                      height: 10,
                    ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                              color: Colors.green,
                              splashColor: Colors.lightGreen,
                              padding: EdgeInsets.only(left: 100, right: 100),
                            child: Text('Register'),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            }

                          )
                      ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          ]),
    );
  }
}
