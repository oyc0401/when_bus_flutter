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
  List<String> dates = [
    "20230217",
    "20230218",
    "20230219",
    "20230220",
    "20230221",
    "20230222",
    "20230223",
    "20230224",
  ];

  List<GlobalKey> _keyList = List.generate(8, (index) => GlobalKey());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
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
          for (int i = 0; i < dates.length; i++)
            Padding(
              key: _keyList[i],
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => HistoryPage(date: dates[i]),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Container(

                    height: 100 - 16-16,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text(dates[i]))),
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
    // print("height: $listViewHeight");

    final double middle = listViewHeight / 2;
    final double scrollPosition = scrollOffset + middle;

    int middleIndex = 0;
    //
    // final RenderBox itemRenderBox1 =
    // _keyList[1].currentContext!.findRenderObject() as RenderBox;
    // final double itemPosition1 = _scrollController.position.viewportDimension -
    //     itemRenderBox1.localToGlobal(Offset.zero).dy;


    print("paddingBottom: ${paddingBottom}");
    // print("itemPosition: ${itemPosition1}");
    // print("scrollPosition: $scrollPosition");

    print(paddingBottom+50);

    for (int i = 0; i < dates.length; i++) {

      final RenderBox itemRenderBox =
          _keyList[i].currentContext!.findRenderObject() as RenderBox;

      print("1");
      final double itemPosition = _scrollController.position.viewportDimension -
          itemRenderBox.localToGlobal(Offset.zero).dy;


      print("itemPosition $i: $itemPosition");
      print("scrollPosition $i: $scrollPosition");

      if (itemPosition >= scrollPosition) {
        middleIndex = i;
        // print("itemPosition: $itemPosition");
        // print("scrollPosition: $scrollPosition");
        break;
      }
    }

    return middleIndex;
  }
}
