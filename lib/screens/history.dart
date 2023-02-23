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
            SizedBox(
              width: 18,
            ),
            Text(DateFormat('yyyy년 MM월 dd일').format(dateTime)),
            isRepeating
                ? Circle(color: Colors.greenAccent)
                : Circle(color: Colors.redAccent)
          ],
        ),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          alertSection(),
          for (int i = 0; i < list.length; i++)
            TimeBar(
              bus: list[i],
              last: list[i].isLast,
              busId: list[i].busId,
            ),
          defaultTime(),
        ],
      ),
    );
  }

  Widget alertSection() {
    return lastExist
        ? Container()
        : Container(
            height: 50,
            color: Color(0xffEEEEEE),
            child: Center(
              child: Text(
                "버스가 잠시후 도착합니다.",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colorss.text1,
                    fontWeight: FontWeight.normal),
              ),
            ),
          );
  }

  Widget defaultTime() {
    return firstExist
        ? Container()
        : TimeBar(
            bus: BusModel(
              id: 0,
              departAt: "${widget.date} 04:40:00",
              createAt: "${widget.date} 04:40:00",
              busId: 0,
              busInterval: 0,
              busNum: '',
              message: '',
              isLast: false,
            ),
            last: false,
          );
  }
}

class TimeBar extends StatelessWidget {
  const TimeBar({Key? key, required this.bus, required this.last, this.busId})
      : super(key: key);

  final BusModel bus;
  final bool last;
  final int? busId;

  String get time {
    DateTime dateTime = DateTime.parse(bus.departAt);
    return DateFormat('HH시 mm분').format(dateTime);
  }

  bool get first {
    DateTime startTime = DateTime.parse(bus.departAt);
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
              SizedBox(
                width: 6,
              ),
              first
                  ? Text(
                      '첫차',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.normal),
                    )
                  : Container(),
              last
                  ? Text(
                      '막차',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    )
                  : Container(),
              Spacer(),
              busIdText(),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              first
                  ? Container()
                  : Text(
                      '${bus.busInterval}분',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colorss.text2,
                          fontWeight: FontWeight.normal),
                    ),
            ],
          ),
        ],
      ),
    );

    // return ListTile(
    //   title:,
    //   subtitle: first ? null :
    // );
  }

  Widget busIdText() {
    return busId == null
        ? Container()
        : Text(
            '${bus.busId % 10000}',
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
      margin: EdgeInsets.only(left: 12),
      width: 6,
      height: 6,
    );
  }
}
