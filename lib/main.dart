import 'package:flutter/material.dart';
import 'package:flutter_application/study_widget/TextEditingControllerStudy.dart';
import 'package:flutter_application/study_widget/TextFieldStudy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'book_store/book_service.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  initializeDateFormatting().then((_) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => BookService(prefs)),
          ],
          child: const MyApp(),
        ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: TextEditingControllerStudy(),
        ),
      ),
    );
  }
}
