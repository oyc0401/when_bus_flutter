import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:when_bus/service/time_format.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("설정"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "24시간 설정",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                CupertinoSwitch(
                  value: TimeFormat.isFull,
                  activeColor: CupertinoColors.activeBlue,
                  onChanged: (bool value) {
                    setState(() {
                      // switchValue = value;
                      TimeFormat.setFull(value);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
