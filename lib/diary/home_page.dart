import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'diary_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final DateTime _kToday;
  late final DateTime _kFirstDay;
  late final DateTime _kLastDay;
  final String _local = 'ko_KR';
  final StartingDayOfWeek _startingDayOfWeek = StartingDayOfWeek.monday;

  // create text controller
  TextEditingController createTextController = TextEditingController();

  // update text controller
  TextEditingController updateTextController = TextEditingController();

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime? _selectedDay;
  DateTime? _focusedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _kToday = DateTime.now();
    _selectedDay = _kToday;
    _kFirstDay = DateTime(_kToday.year - 3, _kToday.month, _kToday.day);
    _kLastDay = DateTime(_kToday.year + 3, _kToday.month, _kToday.day);
    _focusedDay = _kToday;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryService>(
      builder: (context, diaryService, child) {
        List<Diary> diaryList = diaryService.getByDate(_selectedDay!);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                TableCalendar(
                  firstDay: _kFirstDay,
                  lastDay: _kLastDay,
                  focusedDay: _kToday,
                  locale: _local,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: _onDaySelected,
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  calendarFormat: _calendarFormat,
                  rangeSelectionMode: _rangeSelectionMode,
                  eventLoader: (day) => diaryService.getByDate(day),
                  startingDayOfWeek: _startingDayOfWeek,
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    todayTextStyle: TextStyle(color: Colors.black),
                  ),
                  formatAnimationCurve: Curves.easeInOutCirc,
                  formatAnimationDuration: Duration(milliseconds: 300),
                  availableCalendarFormats: const {
                    CalendarFormat.month: '??????',
                    CalendarFormat.twoWeeks: '2???',
                    CalendarFormat.week: '1???'
                  },
                  onRangeSelected: _onRangeSelected,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                Divider(height: 1),
                Expanded(
                  child: diaryList.isEmpty
                      ? Center(
                          child: Text(
                            "??? ??? ????????? ??????????????????.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: diaryList.length,
                          itemBuilder: (context, index) {
                            // ???????????? ????????????
                            int i = diaryList.length - index - 1;
                            Diary diary = diaryList[i];
                            return ListTile(
                              /// text
                              title: Text(
                                diary.text,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),

                              /// createdAt
                              trailing: Text(
                                DateFormat('kk:mm').format(diary.createdAt),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),

                              /// ???????????? update
                              onTap: () {
                                showUpdateDialog(diaryService, diary);
                              },

                              /// ??? ????????? delete
                              onLongPress: () {
                                showDeleteDialog(diaryService, diary);
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            // item ????????? Divider ??????
                            return Divider(height: 1);
                          },
                        ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.create),
              backgroundColor: Colors.indigo,
              onPressed: () {
                showCreateDialog(diaryService);
              },
            ),
          ),
        );
      },
    );
  }

  /// ?????? ??????????????? ????????????
  void showUpdateDialog(DiaryService diaryService, Diary diary) {
    showDialog(
      context: context,
      builder: (context) {
        updateTextController.text = diary.text;
        return AlertDialog(
          title: Text("?????? ??????"),
          content: TextField(
            autofocus: true,
            controller: updateTextController,
            // ?????? ??????
            cursorColor: Colors.indigo,
            decoration: InputDecoration(
              hintText: "??? ??? ????????? ????????? ?????????.",
              // ????????? ????????? ??? ?????? ??????
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ),
            ),
            onSubmitted: (v) {
              // ?????? ?????? ??? ????????????
              updateDiary(diaryService, diary);
              Navigator.pop(context);
            },
          ),
          actions: [
            /// ?????? ??????
            TextButton(
              child: Text(
                "??????",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),

            /// ?????? ??????
            TextButton(
              child: Text(
                "??????",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () {
                // ????????????
                updateDiary(diaryService, diary);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void updateDiary(DiaryService diaryService, Diary diary) {
    // ?????? ?????? ??????
    String updatedText = updateTextController.text.trim();
    if (updatedText.isNotEmpty) {
      diaryService.update(diary.createdAt, updatedText, diary.index);
    }
  }

  void showDeleteDialog(DiaryService diaryService, Diary diary) {
    showDialog(
      context: context,
      builder: (context) {
        updateTextController.text = diary.text;
        return AlertDialog(
          title: Text("?????? ??????"),
          content: Text('"${diary.text}"??? ?????????????????????????'),
          actions: [
            TextButton(
              child: Text(
                "??????",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),

            /// Delete
            TextButton(
              child: Text(
                "??????",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () {
                diaryService.delete(diary.createdAt, diary.index);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  /// ?????? ??????????????? ????????????
  void showCreateDialog(DiaryService diaryService) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("?????? ??????"),
          content: TextField(
            controller: createTextController,
            autofocus: true,
            // ?????? ??????
            cursorColor: Colors.indigo,
            decoration: InputDecoration(
              hintText: "??? ??? ????????? ??????????????????.",
              // ????????? ????????? ??? ?????? ??????
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ),
            ),
            onSubmitted: (_) {
              // ?????? ?????? ??? ????????????
              createDiary(diaryService);
              Navigator.pop(context);
            },
          ),
          actions: [
            /// ?????? ??????
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "??????",
                style: TextStyle(color: Colors.indigo),
              ),
            ),

            /// ?????? ??????
            TextButton(
              onPressed: () {
                createDiary(diaryService);
                Navigator.pop(context);
              },
              child: Text(
                "??????",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        );
      },
    );
  }

  void createDiary(DiaryService diaryService) {
    // ?????? ?????? ??????
    String newText = createTextController.text.trim();
    if (newText.isNotEmpty) {
      diaryService.create(newText, _selectedDay!);
      createTextController.text = "";
    }
  }
}
