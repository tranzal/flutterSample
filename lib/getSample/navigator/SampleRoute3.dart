

import 'package:blog/getSample/navigator/GetNavigatorSample.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleRoute3 extends StatefulWidget{
  @override
  _SampleRoute3 createState() => _SampleRoute3();

}

class _SampleRoute3 extends State<SampleRoute3>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('샘플 라우터 3'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => SampleRoute1());
                  },
                  child: const Text('메인으로 이동')
              ),
            ],
          ),
        )
    );
  }
}