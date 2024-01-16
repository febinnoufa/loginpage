import 'package:flutter/material.dart';
import 'package:loginapp/screens/splash.dart';


// ignore: constant_identifier_names
const save_key_name ='userloggedin';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ligin page',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const Screensplash(),
    );
  }
}
