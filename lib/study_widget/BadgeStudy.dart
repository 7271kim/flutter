import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeStudy extends StatefulWidget {
  const BadgeStudy({Key? key}) : super(key: key);

  @override
  State<BadgeStudy> createState() => _BadgeStudyState();
}

class _BadgeStudyState extends State<BadgeStudy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Badge(
            badgeContent: Text('10'),
            badgeColor: Colors.blue,
            child: Icon(Icons.person, size: 30),
            position: BadgePosition.topStart(),
            animationType: BadgeAnimationType.fade,
          ),
        ),
      ],
    );
  }
}
