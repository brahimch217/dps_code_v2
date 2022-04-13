// ignore_for_file: prefer_const_constructors, unused_import

import 'package:esp/screens/add_product.dart';
import 'package:esp/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp(
        options: const FirebaseOptions(
          appId: '1:928436440396:web:0ecf30a1ee1d517f3a93e9',
          apiKey: 'AIzaSyAkZ0cu37_e5b2hMDW6ivLnmyzkpiBqM5A',
          messagingSenderId: '928436440396',
          projectId: 'disaster-prediction-system',
          authDomain: "disaster-prediction-system.firebaseapp.com",
          databaseURL:
              "https://disaster-prediction-system-default-rtdb.firebaseio.com",
        ),
      );
      return firebaseApp;
    }

    return MaterialApp(
      title: 'Disaster Prediction System',
      home: Scaffold(
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return home_page();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
