import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NaviStudy extends StatefulWidget {
  const NaviStudy({Key? key}) : super(key: key);

  @override
  State<NaviStudy> createState() => _NaviStudyState();
}

class _NaviStudyState extends State<NaviStudy> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NextPage(),
        ),
      ),
      icon: const Icon(
        CupertinoIcons.paperplane,
        size: 28.0,
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.add_circled,
            size: 28.0,
          ),
        ),
      ),
    );
  }
}
