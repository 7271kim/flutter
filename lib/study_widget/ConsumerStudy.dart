import 'package:flutter/material.dart';
import 'package:flutter_application/study_widget/ServiceForChangeNoti.dart';
import 'package:provider/provider.dart';

class ConsumerStudy extends StatefulWidget {
  const ConsumerStudy({Key? key}) : super(key: key);

  @override
  State<ConsumerStudy> createState() => _ConsumerStudyState();
}

class _ConsumerStudyState extends State<ConsumerStudy> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceForChangeNoti>(builder: (context, service, child) {
      return Column(
        children: [
          TextButton(
            onPressed: () {
              service.setAAA(10);
            },
            child: Text("${service.getAAA()}"),
          ),
          TextButton(
            onPressed: () {
              service.setAAA(30);
            },
            child: Text("${service.getAAA()}"),
          )
        ],
      );
    });
  }
}
