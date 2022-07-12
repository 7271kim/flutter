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
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.only(bottom: 1, left: 1, right: 1, top: 1),
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue[300]!, Colors.blue[900]!],
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}
