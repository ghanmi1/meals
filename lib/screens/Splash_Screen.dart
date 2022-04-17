import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

import './Categorie_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        (() => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CategorieScreen()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 222, 166),
      body: Center(
        child: Text(
          'Happy Meals',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
