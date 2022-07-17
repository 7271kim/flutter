import 'package:flutter/material.dart';

class ServiceForChangeNoti extends ChangeNotifier {
  int _aaa = 3;

  int getAAA() {
    return _aaa;
  }

  void setAAA(int aaa) {
    _aaa = aaa;
    notifyListeners();
  }
}
