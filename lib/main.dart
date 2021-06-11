import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Loading.dart';
import 'MyHomePage.dart';
import 'SomethingWentWrong.dart';
import 'TeamPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/MyHomePage': (context) => MyHomePage(),
              '/TeamPage': (context) => TeamPage(),
            },
            home: MyHomePage(),
          );
        }
        return Loading();
      },
    );

  }
}
