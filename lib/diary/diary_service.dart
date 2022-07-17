import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Diary {
  String text; // 내용
  DateTime createdAt; // 작성 시간
  int index;

  Diary({
    required this.text,
    required this.createdAt,
    required this.index,
  });

  /// Diary -> Map 변경
  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "createdAt": createdAt.toString(),
    };
  }
}

class DiaryService extends ChangeNotifier {
  final SharedPreferences _prefs;
  HashMap<DateTime, List<Diary>> diaryList = HashMap<DateTime, List<Diary>>(
    equals: isSameDay,
    hashCode: (key) => key.day * 1000000 + key.month * 10000 + key.year,
  );

  DiaryService(this._prefs) {
    Map<String, dynamic> savedDiary =
        jsonDecode(_prefs.getString("savedDiary")!) ?? {};

    savedDiary.forEach((key, value) {
      DateTime time = DateTime.parse(key);
      diaryList[time] = value;
    });
  }

  /// 특정 날짜의 diary 조회
  List<Diary> getByDate(DateTime date) {
    return diaryList[date] ?? [];
  }

  /// Diary 작성
  void create(String text, DateTime selectedDate) {
    if (diaryList[selectedDate] == null) {
      diaryList[selectedDate] = [];
    }
    diaryList[selectedDate]!.add(Diary(
        text: text,
        createdAt: selectedDate,
        index: diaryList[selectedDate]!.length));

    notifyListeners();
    _saveDiaryList();
  }

  /// Diary 수정
  void update(DateTime createdAt, String newContent, int index) {
    diaryList[createdAt]![index].text = newContent;

    notifyListeners();
    _saveDiaryList();
  }

  /// Diary 삭제
  void delete(DateTime createdAt, int index) {
    diaryList[createdAt]!.removeAt(index);
    int count = 0;
    diaryList[createdAt]!.forEach((diary) {
      diary.index = count++;
    });
    notifyListeners();
    _saveDiaryList();
  }

  void _saveDiaryList() {
    Map<String, String> jsonMap = {};
    diaryList.forEach((key, listDay) {
      for (Diary diary in listDay) {
        Map<String, dynamic> temp = diary.toJson();
        jsonMap[key.toString()] = jsonEncode(temp);
      }
    });
    _prefs.setString("savedDiary", jsonEncode(jsonMap));
  }
}
