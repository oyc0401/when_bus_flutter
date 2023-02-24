import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/bus_model.dart';
import '../service/bus_api/inmat_api_library.dart';
import '../utils/colorss.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.date});

  final String date;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime = DateTime.parse(widget.date);
    init();
    setRepeat();
  }

  late DateTime dateTime;

  bool firstExist = false;
  bool lastExist = false;

  void init() async {
    success = false;

    String formattedDate = DateFormat('yyyyMMdd').format(dateTime);

    List<Map<String, dynamic>> jsonList =
        await InmatApi.auth.history(formattedDate);

    List<BusModel> buses = [];
    for (Map<String, dynamic> json in jsonList) {
      buses.add(BusModel.fromJson(json));
    }

    findStart(buses);
    findLast(buses);

    setState(() {
      list = buses.reversed.toList();
      success = true;
    });
  }

  void findStart(List<BusModel> buses) {
    for (BusModel bus in buses) {
      DateTime startTime = DateTime.parse(bus.departAt);
      if (startTime.hour < 5) {
        firstExist = true;
        break;
      }
    }
  }

  void findLast(List<BusModel> buses) {
    if (buses.isEmpty) {
      lastExist = false;
      return;
    }
    lastExist = buses.last.isLast;
  }

  void setRepeat() async {
    isRepeating = await InmatApi.auth.working();
    setState(() {});
  }

  bool success = false;

  bool isRepeating = false;

  List<BusModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 18,
            ),
            Text(DateFormat('yyyy년 MM월 dd일').format(dateTime)),
            isRepeating
                ? const Circle(color: Colors.greenAccent)
                : const Circle(color: Colors.redAccent)
          ],
        ),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          alertSection(),
          for (BusModel bus in list)
            TimeBar(
              departAt: bus.departAt,
              busInterval: bus.busInterval,
              last: bus.isLast,
              busId: bus.busId,
            ),
          defaultTime(),
        ],
      ),
    );
  }

  Widget alertSection() {
    if (lastExist) {
      return Container();
    }

    int expect = 0;
    if (!firstExist) {
      DateTime now = DateTime.now();
      expect =
          Duration(hours: 4 - now.hour, minutes: 40 - now.minute).inMinutes;
    } else {
      DateTime dateTime =
          DateTime.parse(list.elementAt(list.length - 1).departAt);

      dateTime.add(Duration(minutes: 70));

      DateTime now = DateTime.now();

      Duration d = now.difference(dateTime);

      expect = d.inMinutes;
    }

    String timeString() {
      if (expect <= 60) {
        return "${expect % 60}분";
      }

      return "${expect ~/ 60}시간 ${expect % 60}분";
    }

    return Container(
      height: 55,
      color: const Color(0xffEEEEEE),
      child: Center(
        child: Text(
          // \n예상 도착시간: ${timeString()} 후
          "버스가 운행 중 입니다.",
          style: const TextStyle(
            fontSize: 16,
            color: Colorss.text1,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget defaultTime() {
    return firstExist
        ? Container()
        : TimeBar(
            departAt: "${widget.date} 04:40:00",
            busInterval: 0,
          );
  }
}

class TimeBar extends StatelessWidget {
  const TimeBar({
    Key? key,
    this.busId,
    required this.busInterval,
    required this.departAt,
    this.last = false,
  }) : super(key: key);

  final bool last;

  final String departAt;

  final int? busId;
  final int busInterval;

  String get time {
    DateTime dateTime = DateTime.parse(departAt);
    return DateFormat('HH시 mm분').format(dateTime);
  }

  bool get first {
    DateTime startTime = DateTime.parse(departAt);
    if (startTime.hour < 5) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                time,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colorss.text1,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                width: 6,
              ),
              first
                  ? const Text(
                      '첫차',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.normal),
                    )
                  : Container(),
              last
                  ? const Text(
                      '막차',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    )
                  : Container(),
              const Spacer(),
              busIdText(),
            ],
          ),
          intervalSection(),
        ],
      ),
    );
  }

  Widget intervalSection() {
    return Column(
      children: [
        const SizedBox(
          height: 3,
        ),
        first
            ? Container()
            : Text(
                '$busInterval분',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colorss.text2,
                    fontWeight: FontWeight.normal),
              ),
      ],
    );
  }

  Widget busIdText() {
    return busId == null
        ? Container()
        : Text(
            '${busId! % 10000}',
            style: const TextStyle(
                fontSize: 16,
                color: Colorss.text2,
                fontWeight: FontWeight.normal),
          );
  }
}

class Circle extends StatelessWidget {
  const Circle({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      margin: const EdgeInsets.only(left: 12),
      width: 6,
      height: 6,
    );
  }
}
