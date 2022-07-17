import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService extends ChangeNotifier {
  final SharedPreferences prefs;

  PrefsService(this.prefs) {
    //prefs.setString('test', 'Start'); 한번 세팅하고 지워도 재시작 시 불러올 수 있다.
    prefs.setInt('counter', 10);
    prefs.setBool('repeat', true);
    prefs.setDouble('decimal', 1.5);
    prefs.setString('action', 'Start');
    prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
  }

  String getData() {
    return prefs.getString('test') ?? "";
  }
}
