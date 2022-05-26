import 'package:blog/customChart/widget/barChartEx.dart';
import 'package:blog/customChart/widget/circleEx.dart';
import 'package:blog/customChart/widget/foregroundEx.dart';
import 'package:blog/customChart/widget/lineChartEx.dart';
import 'package:blog/customChart/widget/lineEx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 참고 사이트 https://nomad-programmer.tistory.com/273
void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var list = <WidgetList>[
      WidgetList(name: '선그리기', widget: const CustomPaintLineEx()),
      WidgetList(name: '배경색 앞으로 가져오기', widget: const ForegroundEx()),
      WidgetList(name: '원형으로 그리기', widget: const CircleEx()),
      WidgetList(name: '선형 차트 그리기', widget: const LineChartEx()),
      WidgetList(name: '막대 차트 그리기', widget: const BarChartEx()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('차트 모음'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List<Widget>.generate(list.length, (index) {
          return GestureDetector(
            onTap: () {
              Get.to(list[index].widget);
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.all(8),
              child: Text(list[index].name),
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
