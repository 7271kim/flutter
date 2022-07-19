import 'package:flutter/material.dart';

class PageViewStudy extends StatefulWidget {
  const PageViewStudy({Key? key}) : super(key: key);

  @override
  State<PageViewStudy> createState() => _PageViewStudyState();
}

class _PageViewStudyState extends State<PageViewStudy> {
  final PageController _controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        )
      ],
    );
  }
}
