import 'package:flutter/material.dart';

class ScaffoldStudy extends StatelessWidget {
  const ScaffoldStudy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStudy(),
      body: Text('body'),
      bottomNavigationBar: BottomNavigationBarStudy(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonStudy(),
      drawer: DrawerStudy(),
    );
  }
}

class DrawerStudy extends StatelessWidget {
  const DrawerStudy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class FloatingActionButtonStudy extends StatelessWidget {
  const FloatingActionButtonStudy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.green,
      highlightElevation: 50,
      hoverElevation: 50,
      child: const Icon(Icons.navigation),
    );
  }
}

class BottomNavigationBarStudy extends StatelessWidget {
  const BottomNavigationBarStudy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet),
          label: '나의 판매글',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: '마이페이지',
        ),
      ],
      selectedItemColor: Colors.lightGreen,
    );
  }
}

class AppBarStudy extends StatelessWidget implements PreferredSizeWidget {
  const AppBarStudy({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('data'),
      actions: [
        IconButton(
          onPressed: () {
            print("go my page");
          },
          icon: Icon(
            Icons.person_outline,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        title: const Text('Flight Report'),
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              fit: BoxFit.cover,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment.center,
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
