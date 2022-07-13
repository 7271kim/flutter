import 'package:flutter/material.dart';

class TextStudy extends StatefulWidget {
  const TextStudy({Key? key}) : super(key: key);

  @override
  State<TextStudy> createState() => _TextStudyState();
}

class _TextStudyState extends State<TextStudy> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "TEXT",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
