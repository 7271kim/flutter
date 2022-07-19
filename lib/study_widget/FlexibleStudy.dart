import 'package:flutter/material.dart';

class FlexibleStudy extends StatefulWidget {
  const FlexibleStudy({Key? key}) : super(key: key);

  @override
  State<FlexibleStudy> createState() => _FlexibleStudyState();
}

class _FlexibleStudyState extends State<FlexibleStudy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.cyan,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.teal,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.indigo,
          ),
        )
      ],
    );
  }
}
