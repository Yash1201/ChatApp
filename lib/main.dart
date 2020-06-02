import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/resources/firebase_repository.dart';
import 'package:hello/screens/home_screen.dart';
import 'package:hello/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseRepository _repository = FirebaseRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
          builder: (context,AsyncSnapshot<FirebaseUser> snapshot){
          if(snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }

          },
      ),
    );
  }
}
