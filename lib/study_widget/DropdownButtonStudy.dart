import 'package:flutter/material.dart';

class DropdownButtonStudy extends StatefulWidget {
  const DropdownButtonStudy({Key? key}) : super(key: key);

  @override
  State<DropdownButtonStudy> createState() => _DropdownButtonStudyState();
}

class _DropdownButtonStudyState extends State<DropdownButtonStudy> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            iconEnabledColor: Colors.green,
            isExpanded: true,
            iconSize: 42,
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
