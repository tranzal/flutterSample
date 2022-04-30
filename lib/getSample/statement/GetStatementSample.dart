import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetStatementSample());
}

class GetStatementSample extends StatelessWidget {
  final controller1 = Get.put(CounterController());
  final controller2 = Get.put(ReactiveController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('샘플'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('update'),
              GetBuilder<CounterController>(
                builder: (_) {
                  return Text('count : ${_.count}');
              }),
              ElevatedButton(
                  onPressed: () {
                    controller1.increment();
                  },
                  child: const Text('count 증가')
              ),
              const Text('Reactive'),
              GetX<ReactiveController>(
                  builder: (_) {
                    return Text('count : ${_.count0.value}');
                  }),
              Obx(() {
                return Text('count : ${controller2.count1.value}');
              }),
              Obx(() {
                return Text('user : ${controller2.user.value.id}/${controller2.user.value.name}');
              }),
              Obx(() {
                return Text('List : ${controller2.testList}');
              }),
              ElevatedButton(
                  onPressed: () {
                    controller2.count0 ++;
                  },
                  child: const Text('count0 증가')
              ),
              ElevatedButton(
                  onPressed: () {
                    controller2.count1 ++;
                  },
                  child: const Text('count1 증가')
              ),
              ElevatedButton(
                  onPressed: () {
                    controller2.change(id: controller2.count0.value, name: '나나나${controller2.count1.value}');
                  },
                  child: const Text('User 바꾸기')
              )
            ],
          ),
        ),
      ),
    );
  }
}
