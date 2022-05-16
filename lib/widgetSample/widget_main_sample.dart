
import 'package:blog/widgetSample/widget/AppbarEx.dart';
import 'package:blog/widgetSample/widget/BackDropFilter.dart';
import 'package:blog/widgetSample/widget/BadgeEx.dart';
import 'package:blog/widgetSample/widget/DateFormatEx.dart';
import 'package:blog/widgetSample/widget/ExpandedEx.dart';
import 'package:blog/widgetSample/widget/FittedBoxEx.dart';
import 'package:blog/widgetSample/widget/FontAwesomeIconEx.dart';
import 'package:blog/widgetSample/widget/IfNullOperationEx.dart';
import 'package:blog/widgetSample/widget/ListWidget.dart';
import 'package:blog/widgetSample/widget/SnackBarEx.dart';
import 'package:blog/widgetSample/widget/SpreadOperatorEx.dart';
import 'package:blog/widgetSample/widget/TextOverFlowEx.dart';
import 'package:blog/widgetSample/widget/TextShadowEx.dart';
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