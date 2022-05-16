

import 'package:blog/widgetSample/widget/AppbarEx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWidget extends StatefulWidget {

  @override
  State<ListWidget> createState() => _ListWidget();
}

class _ListWidget extends State<ListWidget> {
  final List<WidgetList> list = [
    WidgetList(name: '앱바', widget: AppbarEx()),
    WidgetList(name: '리스트', widget: ListWidget())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('리스트 위젯'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List<Widget>.generate(list.length, (index) {
          return Container(
            color: Colors.amber,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Get.to(list[index].widget);
              },
              child: Text(list[index].name),
            ),
          );
        }),
      )
    );
  }
}

class WidgetList {
  late String name;
  late Widget widget;

  WidgetList({required this.name, required this.widget});
}