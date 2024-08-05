import 'package:flutter/material.dart';
import 'Batman.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batman Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BatmanPage(),
    );
  }
}
