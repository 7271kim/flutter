import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              return ListTile(
                leading: Icon(Icons.abc), // 아이콘, 텍스트 뭐든 상관없다.
                trailing: Text(
                  DateFormat('kk:mm').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ), // 아이콘, 텍스트 뭐든 상관없다.
                title: Text("Main Title"),
                subtitle: Text("Sub Title"),
                isThreeLine: true, // 3줄 허용
                dense: true, // 좀 더 밀집하게 보이는 효과
                onTap: () => {},
                onLongPress: () => {},
                enabled: false,
              );
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
