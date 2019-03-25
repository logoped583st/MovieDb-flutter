
import 'package:flutter/material.dart';
import 'presentation/authorization/AuthWidget.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for material.AppBar.actions',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.redAccent,
        fontFamily: 'Montserrat',
      ),
      home: MyHomePage(),
    );
  }
}

