import 'package:flutter/material.dart';

class ButtonStudy extends StatefulWidget {
  const ButtonStudy({Key? key}) : super(key: key);

  @override
  State<ButtonStudy> createState() => _ButtonStudyState();
}

class _ButtonStudyState extends State<ButtonStudy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createElevatedButton(),
        createTextButton(),
        createOutlineButton(),
      ],
    );
  }

  OutlinedButton createOutlineButton() {
    return OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
      child: const Text('Click Me'),
    );
  }

  TextButton createTextButton() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.red,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {},
      child: const Text('Gradient'),
    );
  }

  ElevatedButton createElevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      child: Text(
        '국가 및 도시별 차트',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
