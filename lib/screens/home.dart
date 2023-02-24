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
  List<String> get reverseDates {
    List<String> dates = [
      "20230222",
      "20230223",
      "20230224",
    ];

    return dates.reversed.toList();
  }

  List<GlobalKey> _keyList = List.generate(3, (index) => GlobalKey());

  int position = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      position = _getIndexForCenterElement();
      setState(() {

      });
      // _getIndexForCenterElement();
      // print('id: ${_getIndexForCenterElement()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    double itemHeight = 100.0; // 요소 높이
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;
    double halfItemHeight = itemHeight / 2;
    double paddingTop = halfScreenHeight - halfItemHeight;
    double paddingBottom = halfScreenHeight - halfItemHeight;

    return Scaffold(
      body: ListView(
        reverse: true,
        padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
        controller: _scrollController,
        children: [
          for (int i = 0; i < reverseDates.length; i++)
            Padding(
              key: _keyList[i],
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => HistoryPage(date: reverseDates[i]),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Container(
                    height: 100 - 16 - 16,
                    decoration: BoxDecoration(
                      color: position == i ? Colors.blue : Color(0xffd9d9d9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text(reverseDates[i]))),
              ),
            ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          print('id: ${_getIndexForCenterElement()}');
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => CustomScrollViewDemoPage()));
        },
        child: Container(
          width: 30,
          height: 30,
          color: Colors.yellowAccent,
        ),
      ),
    );
  }

  final ScrollController _scrollController = ScrollController();

  int _getIndexForCenterElement() {
    double itemHeight = 100.0; // 요소 높이
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;
    double halfItemHeight = itemHeight / 2;
    double paddingTop = halfScreenHeight - halfItemHeight;
    double paddingBottom = halfScreenHeight - halfItemHeight;

    final double scrollOffset = _scrollController.position.pixels;
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final double listViewHeight = renderBox.size.height;
    final double middle = listViewHeight / 2;
    final double scrollPosition = scrollOffset + middle;

    print("paddingBottom: ${paddingBottom}");

    int index=(scrollPosition - paddingBottom) ~/ itemHeight;

    print(scrollPosition - paddingBottom);
    print(index);




    if(index<0){
      index=0;
    }
    if(index>=reverseDates.length){
      index=reverseDates.length-1;
    }


    return index;
  }
}
