import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//add comments here if you like

//add second comments here if you like

// add the third comments line here if you want

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage('Flutter Cubit learning'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
