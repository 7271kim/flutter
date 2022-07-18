import 'package:flutter/material.dart';

class ListViewStudy extends StatefulWidget {
  const ListViewStudy({Key? key}) : super(key: key);

  @override
  State<ListViewStudy> createState() => _ListViewStudyState();
}

class _ListViewStudyState extends State<ListViewStudy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            scrollDirection:
                Axis.vertical, // Axis.horizontal 수직 수평 원하는 대로 설정 가능하다.
            itemBuilder: (context, index) {
              return Text("text");
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
              );
            },
            itemCount: 2,
          ),
        )
      ],
    );
  }
}
