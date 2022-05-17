
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
      WidgetList(name: '앱바', widget: AppbarEx()),
      WidgetList(name: '리스트', widget: ListWidget()),
      WidgetList(name: '백드랍', widget: BackDropFilterEx()),
      WidgetList(name: '스낵바', widget: SnackBarEx()),
      WidgetList(name: '뱃지', widget: BadgeEx()),
      WidgetList(name: '확장', widget: ExpandedEx()),
      WidgetList(name: '리스트 뷰 안에 if 사용', widget: SpreadOperatorEx()),
      WidgetList(name: '이미지 꽉채우기', widget: FittedBoxEx()),
      WidgetList(name: '글자 그림자', widget: TextShadowEx()),
      WidgetList(name: '글자 오버 플로우', widget: TextOverFlowEx()),
      WidgetList(name: '아이콘 많이!', widget: FontAwesomeIconEx()),
      WidgetList(name: '! ? 뭔지', widget: IfNullOperationEx()),
      WidgetList(name: '날짜 포맷', widget: DateFormatEx()),
      WidgetList(name: '아이폰 처럼 반짝이는거', widget: ShimmerEx()),
      WidgetList(name: '박스 데코', widget: DecoratedBoxEx()),
      WidgetList(name: '랩', widget: WrapEx()),
      WidgetList(name: '행 스크롤', widget: RowScrollEx()),
      WidgetList(name: '안전구역', widget: SafeAreaEx()),
      WidgetList(name: '이미지 바뀌는거', widget: AnimatedCrossFadeEx()),
      WidgetList(name: '컨테이너 바뀌는거', widget: AnimatedContainerFadeEx()),
      WidgetList(name: '박스 움직임', widget: AnimatedPositionFadeEx()),
      WidgetList(name: '박스 날라옴', widget: SlideTransitionEx()),
      WidgetList(name: '탭 알려줌', widget: InkWellEx()),
      WidgetList(name: '클릭 막기', widget: IgnorePointerEx()),
      WidgetList(name: '이미지 확대', widget: HeroEx()),
      WidgetList(name: '이미지 이동', widget: PositionedTransitionEx()),

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