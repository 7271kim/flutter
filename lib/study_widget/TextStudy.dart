import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextStudy extends StatefulWidget {
  const TextStudy({Key? key}) : super(key: key);

  @override
  State<TextStudy> createState() => _TextStudyState();
}

class _TextStudyState extends State<TextStudy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "TEXT",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1.0,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          DateFormat('kk:mm').format(DateTime.now()),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
