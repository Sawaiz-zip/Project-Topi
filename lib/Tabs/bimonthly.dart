import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Bimonthly extends StatefulWidget {
  const Bimonthly({Key key}) : super(key: key);

  @override
  _BimonthlyState createState() => _BimonthlyState();
}

class _BimonthlyState extends State<Bimonthly> {

  bool show = false;


  @override
  Map info;
  int num;

  List<Map> infolist=[];
  void count(){
    FirebaseDatabase.instance.reference().child("Bimonthly").once().then((onvalue) {
      Map data=onvalue.value;
      setState(() {
        num=data.length;
      });

    });
  }




  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future readdata()async
  {
    DatabaseReference postsRef=FirebaseDatabase.instance.reference();
    postsRef.once().then((DataSnapshot snap) {
      Map<dynamic,dynamic> values = snap.value["Bimonthly"];

      for (var key in values.values) {

        info = {
          'age': key['age'],
          'amount': key['amount'],
          'description': key['description'],
          'occupation': key['occupation'],
          'image': key['image'],
          'name': key['name']
        };

        infolist.add(info);
      }
      setState(() {
        show=true;
      });
      print(infolist);
    });
  }
  @override
  void initState()
  {
    super.initState();
    this.count();
    this.readdata();
  }

  bool  pressed =false;
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;



      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 10,

          toolbarHeight: 50,

          backgroundColor: Colors.green,
          title: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text('Bimonthly'),
          ),
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.vertical(

              bottom: Radius.circular(30),
            ),
          ),

        ),
        body: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: _size.height,
          width: _size.width,
          color: Colors.white,

          child: Stack(
              children:[
                Container(
                  padding: EdgeInsets.all(20),
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

                new Container(
                  child:  show==true? new ListView.builder(itemCount: infolist.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(info);
                      Map x=infolist.elementAt(index);
                      return  SingleChildScrollView(
                        child: Column(
                          children: [
                            PostsUI(
                                x['age'], x['amount'], x['description'],
                                x['occupation'], x['image'], x['name']),
                          ],
                        ),
                      );

                    },
                  ): Center(child: CircularProgressIndicator()),
                ),]

          ),
        ),
      );
    }
    Widget PostsUI(String age, String amount, String description,
        String occupation, String image, String name) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          clipBehavior: Clip.antiAlias,
          elevation: 16,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {

            },
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(image),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Name: '),
                              ),

                              Text(
                                name,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('AGE: '),
                              ),

                              Text(
                                age,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Occupation: '),
                              ),

                              Text(
                                occupation ,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(

                    padding: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(

                              onPressed:(){
                                setState(() {
                                  pressed=!pressed;
                                });

                              },
                              style: TextButton.styleFrom(
                                textStyle:
                                const TextStyle(fontSize: 10),
                              ),

                              child: const Text(
                                'Description',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Visibility(
                              visible: pressed,
                              child: Column(
                                children: [

                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                          'Description :$description',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black54))),

                                ],
                              ),
                            )

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: RaisedButton(
                            color: Colors.green,

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),

                            onPressed: () {  },
                            child: Text('Donate'),
                          ),
                        )
                      ],
                    ),
                  ),

                ]
            ),
          ),),
      );
    }
  }



