import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTabControllerStudy extends StatefulWidget {
  const DefaultTabControllerStudy({Key? key}) : super(key: key);

  @override
  State<DefaultTabControllerStudy> createState() =>
      _DefaultTabControllerStudyState();
}

class _DefaultTabControllerStudyState extends State<DefaultTabControllerStudy> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NextPage(),
        ),
      ),
      icon: const Icon(
        CupertinoIcons.paperplane,
        size: 28.0,
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: "Chats"),
                  Tab(text: "Requests"),
                ],
              ),
            ),
            body: TabBarView(children: [
              Text('data1'),
              Text('data2'),
            ])),
      ),
    );
  }
}
