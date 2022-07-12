import 'package:flutter/material.dart';

class ContainerStudy extends StatefulWidget {
  const ContainerStudy({Key? key}) : super(key: key);

  @override
  State<ContainerStudy> createState() => _ContainerStudyState();
}

class _ContainerStudyState extends State<ContainerStudy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 8, top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue[300]!, Colors.blue[900]!],
        ),
      ),
    );
  }
}
