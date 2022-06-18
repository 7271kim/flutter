import 'package:flutter/material.dart';
import 'package:flutter_application/book_store/book_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(
        builder: (context, bookService, child) => Scaffold(
              appBar: getAppBar(bookService),
              body: bookService.isEmpty()
                  ? getBodyEmptyGride()
                  : getBookListGride(bookService),
            ));
  }

  ListView getBookListGride(BookService bookService) {
    return ListView.builder(
      itemCount: bookService.bookList.length,
      itemBuilder: (context, index) {
        Book book = bookService.bookList[index];
        return ListTile(
          leading: Image.network(
            book.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: Text(book.title),
          subtitle: Text(book.subtitle),
          onTap: () async {
            Uri _url = Uri.parse(book.imageLink);
            if (!await launchUrl(_url)) throw 'Could not launch $_url';
          },
        );
      },
    );
  }

  Center getBodyEmptyGride() {
    return Center(
      child: Text(
        "검색어를 입력해 주세요",
        style: TextStyle(
          fontSize: 21,
          color: Colors.grey,
        ),
      ),
    );
  }

  AppBar getAppBar(BookService bookService) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Book Store",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                getTotalCountGride(bookService),
                getSearchTextFieldGride(bookService)
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 72),
        ));
  }

  TextField getSearchTextFieldGride(BookService bookService) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "원하시는 책을 검색해주세요.",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            search(bookService);
          },
        ),
      ),
      onSubmitted: (_) {
        search(bookService);
      },
    );
  }

  Container getTotalCountGride(BookService bookService) {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(right: 12),
      child: Text(
        "total ${bookService.bookList.length}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  void search(BookService bookService) {
    String keyword = searchController.text;
    if (keyword.isNotEmpty) {
      bookService.getBookList(keyword);
    }
  }
}
