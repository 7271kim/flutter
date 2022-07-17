import 'package:flutter/material.dart';
import 'package:flutter_application/study_widget/PrefsService.dart';
import 'package:provider/provider.dart';

class SharedPreferencesStudy extends StatefulWidget {
  const SharedPreferencesStudy({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesStudy> createState() => _SharedPreferencesStudyState();
}

class _SharedPreferencesStudyState extends State<SharedPreferencesStudy> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PrefsService>(builder: (_, service, child) {
      return Text("${service.getData()}");
    });
  }
}
