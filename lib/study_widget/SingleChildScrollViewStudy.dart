import 'package:flutter/material.dart';

class SingleChildScrollViewStudy extends StatefulWidget {
  const SingleChildScrollViewStudy({Key? key}) : super(key: key);

  @override
  State<SingleChildScrollViewStudy> createState() =>
      _SingleChildScrollViewStudyState();
}

class _SingleChildScrollViewStudyState
    extends State<SingleChildScrollViewStudy> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.vertical,
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          createContaner(Colors.red),
          createContaner(Colors.black),
          createContaner(Colors.blue),
          createContaner(Colors.red),
          createContaner(Colors.black),
          createContaner(Colors.blue),
        ],
      ),
    );
  }

  Container createContaner(color) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(color: color),
    );
  }
}
