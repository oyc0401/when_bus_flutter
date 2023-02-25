import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'date_scroll.dart';
import 'history.dart';
import 'setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String get today {
    DateTime now = DateTime.now();
    String text = DateFormat('yyyyMMdd').format(now);
    print(text);
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "버스 언제와",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (builder) => SettingPage(),
                ),
              );
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1601 버스 시간표",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            CupertinoButton(
              color: Color(0xffE43607),
              // color: Color(0xff35cee2),
              child: Text(
                "오늘 시간표 확인",
                style: TextStyle(
                    // color: Color(0xff262626),
                    ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (builder) => HistoryPage(date: today),
                  ),
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            CupertinoButton(
              // color: Color(0xffE43607),
              color: Color(0xff5835E2),
              child: Text("전체 시간표 확인"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (builder) => DateScrollPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
