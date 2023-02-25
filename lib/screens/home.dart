import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:when_bus/screens/history.dart';
import '../models/bus_model.dart';
import '../service/bus_api/inmat_api_library.dart';
import '../utils/colorss.dart';
import 'cusom_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

PageRouteBuilder customRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  int currentIndex = 0;

  late double paddingBottom;
  final double itemHeight = 100.0; // 요소 높이

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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;
    double halfItemHeight = itemHeight / 2;
    paddingBottom = halfScreenHeight - halfItemHeight;

    double width = MediaQuery.of(context).size.width;
    if (!isSuccess) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                      duration: Duration(milliseconds: 100),
                      height:
                          currentIndex == i ? itemHeight : itemHeight - 16 - 16,
                      width: currentIndex == i ? 10000 : width - 80,
                      decoration: BoxDecoration(
                        color:
                            // currentIndex == i ? Colors.blue :
                            Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text(reverseDates[i]))),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
