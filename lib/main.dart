import 'dart:ui';

import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Card(
          child: Text(
            'data',
            style: TextStyle(fontSize: 100),
          ),
        ),
      ),
    );
  }
}
