import 'package:flutter/material.dart';

class TextEditingControllerStudy extends StatefulWidget {
  const TextEditingControllerStudy({Key? key}) : super(key: key);

  @override
  State<TextEditingControllerStudy> createState() =>
      _TextEditingControllerStudyState();
}

class _TextEditingControllerStudyState
    extends State<TextEditingControllerStudy> {
  // create text controller
  TextEditingController createTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: createTextController,
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
    );
  }
}
