import 'package:flutter/material.dart';

class TabStudy extends StatefulWidget {
  TabStudy({Key? key}) : super(key: key);

  @override
  State<TabStudy> createState() => _TabStudyState();
}

class _TabStudyState extends State<TabStudy>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _seletedIndex = 1;

  @override
  void initState() {
    super.initState();
    settingTabController();
    //컨트롤러 변화 시 호출할 이벤트 설정
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          TabBarView(
            children: [
              Text("${_seletedIndex}"),
              Text("${_seletedIndex}"),
              Text("${_seletedIndex}"),
            ],
            controller: _tabController,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: TabPageSelector(
              color: Colors.blue,
              selectedColor: Colors.grey,
              controller: _tabController,
              indicatorSize: 8,
            ),
          )
        ],
      ),
    );
  }

  void settingTabController() {
    _tabController = TabController(
      length: 3, vsync: this,
      //vsync에 this 형태로 전달해야 애니메이션이 정상 처리, with SingleTickerProviderStateMixin 필요하다.
    );
    _tabController.index = 1;
    _tabController.addListener(() {
      setState(() {
        _seletedIndex = _tabController.index;
      });
    });
  }
}
