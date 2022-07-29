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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}
