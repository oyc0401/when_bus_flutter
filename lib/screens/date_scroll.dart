import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:when_bus/screens/history.dart';
import '../models/bus_model.dart';
import '../service/bus_api/inmat_api_library.dart';
import '../utils/colorss.dart';
import '../_demo/cusom_list.dart';

class DateScrollPage extends StatefulWidget {
  const DateScrollPage({Key? key}) : super(key: key);

  @override
  State<DateScrollPage> createState() => _DateScrollPageState();
}

class _DateScrollPageState extends State<DateScrollPage> {
  final ScrollController _scrollController = ScrollController();

  int currentIndex = 0;

  late double paddingBottom;
  final double itemHeight = 90.0; // 요소 높이
  final double paddingHeight = 16;

  List<String> dates = [];

  List<String> get reverseDates => dates.reversed.toList();

  bool isSuccess = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    _scrollController.addListener(() {
      currentIndex = _getIndexForCenterElement();

      setState(() {});
    });
  }

  init() async {
    dates = await InmatApi.auth.availableTimes();
    isSuccess = true;
    setState(() {});
  }

  int _getIndexForCenterElement() {
    int index = (_scrollController.offset / itemHeight).round();

    if (index < 0) {
      index = 0;
    }
    if (index >= reverseDates.length) {
      index = reverseDates.length - 1;
    }

    return index;
  }

  double _previousPosition = 0;

  double _getScrollSpeed() {
    final currentPosition = _scrollController.position.pixels;
    double speed = (currentPosition - _previousPosition).abs();
    _previousPosition = currentPosition;
    // print('Scroll speed: $speed');

    return speed;
  }

  DateTime now = DateTime.now();

  String timeKor(String date) {
    DateTime dateTime = DateTime.parse(date);
    if (dateTime.year == now.year) {
      return DateFormat('MM월 dd일').format(dateTime);
    } else {
      return DateFormat('YYYY년 MM월 dd일').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;
    double halfItemHeight = itemHeight / 2;
    paddingBottom = halfScreenHeight - halfItemHeight;

    double width = MediaQuery.of(context).size.width;
    if (!isSuccess) {
      return Scaffold(
        // appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // foregroundColor: Colors.transparent,
        backgroundColor: Color(0xffffff),
        // shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.only(top: paddingBottom, bottom: paddingBottom),
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = reverseDates.length - 1; i >= 0; i--)
              // for (int i = 0; i < reverseDates.length; i++)
              Padding(
                // key: _keyList[i],
                padding: EdgeInsets.symmetric(
                    vertical: paddingHeight, horizontal: 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) =>
                            HistoryPage(date: reverseDates[i]),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    height: currentIndex == i
                        ? itemHeight - paddingHeight
                        : itemHeight - paddingHeight * 2,
                    width: currentIndex == i ? 10000 : width - 80,
                    decoration: BoxDecoration(
                      color: currentIndex == i
                          ? Color(0xffd6f0f8)
                          : Color(0xfff3f3f3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        timeKor(reverseDates[i]),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
