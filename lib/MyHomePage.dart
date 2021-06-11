import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'MyButton.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final DatabaseReference database = FirebaseDatabase.instance.reference().child("Counter");

  sendData(value) {
    database.update({
      'Counter': value,
    });
  }

  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        title: Center(child: Text("UP-Down Counter")),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _counter.toString(),
              style: TextStyle(
                  fontSize: 220,
                  fontWeight: FontWeight.w500,
                  fontFamily: "DS-DIGIT"
              ),
            ),
            Container(
              width: width*.9,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap : (){
                              if(_counter>0){
                                setState(() {
                                  _counter = _counter - 1;
                                  sendData(_counter);
                                });
                              }
                            },
                            child: MyButton(text: "Decrease",buttonColor: Colors.black,textColor: Colors.white,)),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: InkWell(
                            onTap : (){
                              if(_counter<9){
                                setState(() {
                                  _counter = _counter + 1;
                                  sendData(_counter);
                                });
                              }
                            },
                            child: MyButton(text: "Increase",buttonColor: Colors.black,textColor: Colors.white,)),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _counter = 0;
                        // _defaultValue = 0;
                        sendData(_counter);
                      });
                    },
                    child: MyButton(text: "Reset",buttonColor: Colors.black,textColor: Colors.white,),
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/TeamPage");
                    },
                    child: MyButton(text: "Team   Members",buttonColor: Colors.black,textColor: Colors.white,),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}