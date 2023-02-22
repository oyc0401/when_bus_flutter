import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'bus_model.dart';
import 'service/bus_api/inmat_api_library.dart';
import 'utils/colorss.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    getRepeat();
  }

  final DateTime now = DateTime.now();
  DateTime dateTime = DateTime.now();

  init() async {
    success = false;

    String formattedDate = DateFormat('yyyyMMdd').format(dateTime);

    List<Map<String, dynamic>> jsonList =
        await InmatApi.auth.history(formattedDate);
    List<BusModel> buses = [];
    for (Map<String, dynamic> json in jsonList) {
      buses.add(BusModel.fromJson(json));
    }
    list = buses;

    setState(() {
      success = true;
    });
  }

  getRepeat() async {
    isRepeating = await InmatApi.auth.working();
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
        leading: IconButton(
          onPressed: () {
            dateTime = dateTime.add(const Duration(days: -1));
            init();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          DateFormat('yyyyMMdd').format(now) ==
                  DateFormat('yyyyMMdd').format(dateTime)
              ? Container()
              : IconButton(
                  onPressed: () {
                    dateTime = dateTime.add(const Duration(days: 1));
                    init();
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                  ),
                ),
        ],
      ),
      body: success ? body() : Container(),
    );
  }

  Widget body() {
    if (list.isEmpty) {
      return const Center(
        child: Text(
          "시간표가 없습니다.",
          style: TextStyle(fontSize: 16, color: Colorss.text1),
        ),
      );
    }

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        for (BusModel m in list)
          TimeBar(
            date: m.departAt,
            id: m.busId,
          )
      ],
    );
  }
}

class TimeBar extends StatelessWidget {
  const TimeBar({Key? key, required this.date, required this.id})
      : super(key: key);

  final String date;
  final int id;

  String get time {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('HH시 mm분').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        time,
        style: const TextStyle(
            fontSize: 16, color: Colorss.text1, fontWeight: FontWeight.normal),
      ),
      subtitle: Text(
        '$id',
        style: const TextStyle(
            fontSize: 12, color: Colorss.text2, fontWeight: FontWeight.normal),
      ),
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
