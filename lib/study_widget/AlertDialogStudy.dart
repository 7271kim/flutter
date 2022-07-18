import 'package:flutter/material.dart';

class AlertDialogStudy extends StatefulWidget {
  const AlertDialogStudy({Key? key}) : super(key: key);

  @override
  State<AlertDialogStudy> createState() => _AlertDialogStudyState();
}

class _AlertDialogStudyState extends State<AlertDialogStudy> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("일기 작성"),
      content: TextField(
        autofocus: true,
        // 커서 색상
        cursorColor: Colors.indigo,
        decoration: InputDecoration(
          hintText: "한 줄 일기를 작성해주세요.",
          // 포커스 되었을 때 밑줄 색상
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo),
          ),
        ),
        onSubmitted: (_) {},
      ),
      actions: [
        /// 취소 버튼
        TextButton(
          onPressed: () {},
          child: Text(
            "취소",
            style: TextStyle(color: Colors.indigo),
          ),
        ),

        /// 작성 버튼
        TextButton(
          onPressed: () {},
          child: Text(
            "작성",
            style: TextStyle(color: Colors.indigo),
          ),
        ),
      ],
    );
  }
}
