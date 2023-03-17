// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:sniff_me/login_existing.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key key}) : super(key: key);
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
        ),
      ),
      // backgroundColor: Colors.pinkAccent,
    );
  }
}
