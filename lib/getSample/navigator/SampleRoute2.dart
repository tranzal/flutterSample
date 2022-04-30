

import 'package:blog/getSample/navigator/GetNavigatorSample.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleRoute2 extends StatefulWidget{
  @override
  _SampleRoute2 createState() => _SampleRoute2();

}

class _SampleRoute2 extends State<SampleRoute2>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('샘플 라우터 2'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Get.off(() => SampleRoute1());

                  },
                  child: const Text('메인으로 이동')
              ),
            ],
          ),
        )
    );
  }
}