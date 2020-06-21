import 'package:flutter/material.dart';
import 'package:blockemployee/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Employee App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(),
    );
  }
}
