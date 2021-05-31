import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'homedrawer.dart';
class SponsorAchild extends StatefulWidget {
  const SponsorAchild({Key key}) : super(key: key);

  @override
  _SponsorAchildState createState() => _SponsorAchildState();
}

class _SponsorAchildState extends State<SponsorAchild> {
  @override
  Map info;
  int num;
  List<Map> infolist=[];
void count(){
  FirebaseDatabase.instance.reference().child("SponsorAChild list").once().then((onvalue) {
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
    Map<dynamic,dynamic> values = snap.value["SponsorAChild list"];

    for (var key in values.values) {

      info = {
        'age': key['age'],
        'amount': key['amount'],
        'description': key['description'],
        'grade': key['grade'],
        'image': key['image'],
        'name': key['name']
      };
infolist.add(info);
    }
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
//   var KEYS=snap.value.keys;
//   var DATA=snap.value;
//   postsList.clear();
//   for(var individualKey in KEYS )
//     {
//       Posts posts=new Posts
//         (
//           DATA[individualKey]['age'],
//         DATA[individualKey]['amount'],
//         DATA[individualKey]['description'],
//         DATA[individualKey]['grade'],
//         DATA[individualKey]['image'],
//         DATA[individualKey]['name'],
//
//
//
//
//
//       );
//       postsList.add(posts);
//      }
//   setState(() {
//     print('lenght:$postsList.lenght');
//   });
// });

  bool pressed = false;
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Container(
          child: new ListView.builder(itemCount: infolist.length,
            itemBuilder: (BuildContext context, int index) {
            print(info);
            Map x=infolist.elementAt(index);
            return  PostsUI(
                x['age'], x['amount'], x['description'],
                x['grade'], x['image'], x['name']);

            },
          )
      ),
    );
  }
  Widget PostsUI(String age, String amount, String description,
      String grade, String image, String name) {
    return new Card(
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

            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, bottom: 20),
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        backgroundColor: Colors.black54),
                  ),
                ),
                Ink.image(
                    image: NetworkImage(image),
                    colorFilter: ColorFilter.mode(
                        Colors.white, BlendMode.modulate),
                    height: 180,
                    fit: BoxFit.fitWidth),
              ],
            ),
            Container(
              padding: EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle:
                      const TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    },
                    child: const Text(
                      'Description',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  pressed == true
                      ? Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              'Age : $age',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54))),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              'Grade :$grade',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54))),

                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              'Description :$description',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54))),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              'Amount :$amount',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54))),

                    ],
                  )
                      : Text('                                 '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



