import 'package:flutter/material.dart';

import './screens/Splash_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromARGB(255, 234, 222, 166),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  // body: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
                  // bodyText2: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      home: SplashScreen(),
    );
  }
}
