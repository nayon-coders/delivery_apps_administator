import 'package:driver/view/flash/flash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/home/screens/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAppCheck.instance.activate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All One Autos',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins"
      ),
      home: FirebaseAuth.instance!.currentUser != null ? Home() : Flash(),
    );
  }
}
