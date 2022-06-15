import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feed.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Builder(
        builder: (context) {
          DefaultTabController.of(context)?.addListener(() {
            setState(() {});
          });

          return Scaffold(
            body: Stack(
              children: [
                Card(
                  child: Text(
                    "data",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
