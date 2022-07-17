import 'package:flutter/material.dart';

class TextFieldStudy extends StatefulWidget {
  const TextFieldStudy({Key? key}) : super(key: key);

  @override
  State<TextFieldStudy> createState() => _TextFieldStudyState();
}

class _TextFieldStudyState extends State<TextFieldStudy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
          onSubmitted: (_) {
            Navigator.pop(context);
          },
        ),
        TextField(
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
          onSubmitted: (_) {
            Navigator.pop(context);
          },
          obscureText: true, // 비밀번호 형식인지
        )
      ],
    );
  }
}
