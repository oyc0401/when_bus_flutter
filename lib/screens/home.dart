import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_scroll.dart';
import 'setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              "1601 버스 시간표 히스토리",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CupertinoButton(
              color: Color(0xffE43607),
              child: Text("1601 시간표 확인"),
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
