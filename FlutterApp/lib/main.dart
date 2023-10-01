
import 'package:firebase_core/firebase_core.dart';
import 'package:iot_flutter_project/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyB8Uyqbhp_pq-Ir3B1BBVTCB4F3WFjcnPI",
    authDomain: "trainproject1-ad5f4.firebaseapp.com",
    databaseURL: "https://trainproject1-ad5f4-default-rtdb.firebaseio.com",
    projectId: "trainproject1-ad5f4",
    storageBucket: "trainproject1-ad5f4.appspot.com",
    messagingSenderId: "111623770061",
    appId: "1:111623770061:web:db2c2f8699447b22163e84",
    measurementId: "G-T4GM40D8BY"
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Train Station',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(247, 206, 206, 206)),
      home: const HomeScreen(),
    );
  }
}
