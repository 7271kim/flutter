import 'package:flutter/material.dart';

class GestureDetectorStudy extends StatefulWidget {
  const GestureDetectorStudy({Key? key}) : super(key: key);

  @override
  State<GestureDetectorStudy> createState() => _GestureDetectorStudyState();
}

class _GestureDetectorStudyState extends State<GestureDetectorStudy>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _seletedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;

    _tabController.addListener(() {
      setState(() {
        _seletedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('data1'),
                      GestureDetector(
                        onTap: () {
                          _tabController.index = 1;
                        },
                        child: Column(
                          children: [
                            Icon(Icons.person, color: Colors.black),
                            Text(
                              '라이브러리',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text("data2"),
                  Text("data3"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
