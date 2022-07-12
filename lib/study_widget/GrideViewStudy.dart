import 'package:flutter/material.dart';

class GrideViewStudy extends StatefulWidget {
  const GrideViewStudy({Key? key}) : super(key: key);

  @override
  State<GrideViewStudy> createState() => _GrideViewStudyState();
}

class _GrideViewStudyState extends State<GrideViewStudy> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
        ),
        itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Text("${index}"),
            ));
  }
}
