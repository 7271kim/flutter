import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeStudy extends StatefulWidget {
  const DateTimeStudy({Key? key}) : super(key: key);

  @override
  State<DateTimeStudy> createState() => _DateTimeStudyState();
}

class _DateTimeStudyState extends State<DateTimeStudy> {
  @override
  Widget build(BuildContext context) {
    DateTime toDay = DateTime.now();
    DateTime moonLanding = DateTime.parse('1969-07-20 20:18:04Z');
    DateTime berlinWallFell = DateTime.utc(1989, 11, 9);
    DateTime all = DateTime(1989, 11, 9, 4, 20, 43);
    return Column(
      children: [
        Text("${DateFormat('yyyy/MMM/dd - HH:mm:ss EEE E').format(toDay)}"),
        Text("${DateFormat('yyyy/MM/dd').format(moonLanding)}"),
        Text("${DateFormat('yyyy/MM/dd').format(berlinWallFell)}"),
        Text("${DateFormat('yyyy/MM/dd - HH:mm:ss').format(all)}"),
        Text("${toDay.month == DateTime.november}"),
        Text("${toDay.year}"),
        Text("${toDay.weekday == DateTime.thursday}"),
        // EEE : 	Tuesday (요일)
        // E : Tue (요일)
      ],
    );
  }
}
