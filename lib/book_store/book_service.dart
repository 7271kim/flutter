import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'book.dart';

class BookService extends ChangeNotifier {
  // 책 목록

  SharedPreferences prefs;

  List<Book> bookList = [];

  BookService(this.prefs);

  void getBookList(String keyword) async {
    bookList.clear(); // 기존에 들어있는 데이터 초기화

    // API 호출
    Response response = await Dio().get(
      "https://www.googleapis.com/books/v1/volumes?q=$keyword&startIndex=0&maxResults=40",
    );

    response.data['items']?.forEach((item) {
      String title = item['volumeInfo']['title'] ?? '';
      String subtitle = item['volumeInfo']['subtitle'] ?? '';
      String imageUrl = item['volumeInfo']['imageLinks']['thumbnail'] ?? '';
      String imageLink = item['volumeInfo']['previewLink'] ?? '';
      bookList.add(new Book(title, subtitle, imageUrl, imageLink));
    });

    notifyListeners();
  }

  bool isEmpty() {
    return bookList.isEmpty;
  }
}
