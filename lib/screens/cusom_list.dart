/*
 * @Author: LinXunFeng linxunfeng@yeah.net
 * @Repo: https://github.com/LinXunFeng/flutter_scrollview_observer
 * @Date: 2022-08-08 00:20:03
 */
import 'package:flutter/material.dart';
import 'package:scrollview_observer/scrollview_observer.dart';


T? ambiguate<T>(T? value) => value;

class CustomScrollViewDemoPage extends StatefulWidget {
  const CustomScrollViewDemoPage({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewDemoPage> createState() =>
      _CustomScrollViewDemoPageState();
}

class _CustomScrollViewDemoPageState extends State<CustomScrollViewDemoPage> {
  BuildContext? _sliverListCtx;
  int _hitIndexForCtx1 = 0;


  ScrollController scrollController = ScrollController();

  late SliverObserverController observerController;

  @override
  void initState() {
    super.initState();

    observerController = SliverObserverController(controller: scrollController);

    // Trigger an observation manually
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((timeStamp) {
      observerController.dispatchOnceObserve(
        sliverContext: _sliverListCtx!,
      );
    });
  }

  @override
  void dispose() {
    observerController.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CustomScrollView")),
      body: SliverViewObserver(
        controller: observerController,
        child: _buildScrollView(),
        sliverListContexts: () {
          return [
            if (_sliverListCtx != null) _sliverListCtx!,
          ];
        },
        onObserveAll: (resultMap) {
          final model1 = resultMap[_sliverListCtx];
          if (model1 != null &&
              model1.visible &&
              model1 is ListViewObserveModel) {
            debugPrint('1 visible -- ${model1.visible}');
            debugPrint('1 firstChild.index -- ${model1.firstChild?.index}');
            debugPrint('1 displaying -- ${model1.displayingChildIndexList}');
            setState(() {
              int len=(model1.displayingChildModelList.first.index+model1.displayingChildModelList.last.index)~/2;


              _hitIndexForCtx1 = len;

              // model1.displayingChildIndexList.


            });
          }

        },
      ),

    );
  }

  Widget _buildScrollView() {
    return CustomScrollView(
      controller: scrollController,
      // scrollDirection: Axis.horizontal,
      slivers: [
        _buildSliverListView(),
      ],
    );
  }

  Widget _buildSliverListView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (ctx, index) {
          _sliverListCtx ??= ctx;
          return AnimatedContainer(
            // height: _hitIndexForCtx1==index ? 80 : 50,
            height: 80,
            // color: _hitIndexForCtx1 == index ? Colors.red : Colors.black12,
            duration: const Duration(seconds: 1),
            child: Center(
              child: Text(
                "index -- $index",
                style: TextStyle(
                  color:
                  // _hitIndexForCtx1 == index ? Colors.white :
                  Colors.black,
                ),
              ),
            ),
          );
        },
        childCount: 30,
      ),
    );
  }


}
