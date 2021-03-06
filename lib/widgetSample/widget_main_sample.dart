
import 'package:blog/widgetSample/widget/AnimatedContainerEx.dart';
import 'package:blog/widgetSample/widget/AnimatedCrossFadeEx.dart';
import 'package:blog/widgetSample/widget/AnimatedPositionEx.dart';
import 'package:blog/widgetSample/widget/AppbarEx.dart';
import 'package:blog/widgetSample/widget/BackDropFilter.dart';
import 'package:blog/widgetSample/widget/BadgeEx.dart';
import 'package:blog/widgetSample/widget/DateFormatEx.dart';
import 'package:blog/widgetSample/widget/DecoratedBoxEx.dart';
import 'package:blog/widgetSample/widget/ExpandedEx.dart';
import 'package:blog/widgetSample/widget/FittedBoxEx.dart';
import 'package:blog/widgetSample/widget/FontAwesomeIconEx.dart';
import 'package:blog/widgetSample/widget/HeroEx.dart';
import 'package:blog/widgetSample/widget/IfNullOperationEx.dart';
import 'package:blog/widgetSample/widget/IgnorePointerEx.dart';
import 'package:blog/widgetSample/widget/InkWellEx.dart';
import 'package:blog/widgetSample/widget/InteractiveViewerEx.dart';
import 'package:blog/widgetSample/widget/ListWidget.dart';
import 'package:blog/widgetSample/widget/PositionedTransitionEx.dart';
import 'package:blog/widgetSample/widget/RowScrollEx.dart';
import 'package:blog/widgetSample/widget/SafeAreaEx.dart';
import 'package:blog/widgetSample/widget/ShimmerEx.dart';
import 'package:blog/widgetSample/widget/SlideTransitionEx.dart';
import 'package:blog/widgetSample/widget/SnackBarEx.dart';
import 'package:blog/widgetSample/widget/SpreadOperatorEx.dart';
import 'package:blog/widgetSample/widget/TextOverFlowEx.dart';
import 'package:blog/widgetSample/widget/TextShadowEx.dart';
import 'package:blog/widgetSample/widget/WrapEx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
  initializeDateFormatting();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var list = <WidgetList>[
      WidgetList(name: '??????', widget: AppbarEx()),
      WidgetList(name: '?????????', widget: ListWidget()),
      WidgetList(name: '?????????', widget: BackDropFilterEx()),
      WidgetList(name: '?????????', widget: SnackBarEx()),
      WidgetList(name: '??????', widget: BadgeEx()),
      WidgetList(name: '??????', widget: ExpandedEx()),
      WidgetList(name: '????????? ??? ?????? if ??????', widget: SpreadOperatorEx()),
      WidgetList(name: '????????? ????????????', widget: FittedBoxEx()),
      WidgetList(name: '?????? ?????????', widget: TextShadowEx()),
      WidgetList(name: '?????? ?????? ?????????', widget: TextOverFlowEx()),
      WidgetList(name: '????????? ??????!', widget: FontAwesomeIconEx()),
      WidgetList(name: '! ? ??????', widget: IfNullOperationEx()),
      WidgetList(name: '?????? ??????', widget: DateFormatEx()),
      WidgetList(name: '????????? ?????? ???????????????', widget: ShimmerEx()),
      WidgetList(name: '?????? ??????', widget: DecoratedBoxEx()),
      WidgetList(name: '???', widget: WrapEx()),
      WidgetList(name: '??? ?????????', widget: RowScrollEx()),
      WidgetList(name: '????????????', widget: SafeAreaEx()),
      WidgetList(name: '????????? ????????????', widget: AnimatedCrossFadeEx()),
      WidgetList(name: '???????????? ????????????', widget: AnimatedContainerFadeEx()),
      WidgetList(name: '?????? ?????????', widget: AnimatedPositionFadeEx()),
      WidgetList(name: '?????? ?????????', widget: SlideTransitionEx()),
      WidgetList(name: '??? ?????????', widget: InkWellEx()),
      WidgetList(name: '?????? ??????', widget: IgnorePointerEx()),
      WidgetList(name: '????????? ??????', widget: HeroEx()),
      WidgetList(name: '????????? ??????', widget: PositionedTransitionEx()),
      WidgetList(name: '?????? ????????? ????????? ?????? ?????????', widget: InteractiveViewerEx()),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List<Widget>.generate(list.length, (index) {
          return GestureDetector(
            onTap: () {
              Get.to(list[index].widget);
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.amber,
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.all(8),
              child: Text(list[index].name,overflow: TextOverflow.visible),
            ),
          );
        }),
      ),
    );
  }
}

class WidgetList {
  late String name;
  late Widget widget;

  WidgetList({required this.name, required this.widget});
}