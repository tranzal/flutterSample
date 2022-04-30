

import 'package:blog/getSample/navigator/GetNavigatorSample.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleRoute5 extends StatefulWidget{
  @override
  _SampleRoute5 createState() => _SampleRoute5();
}

class _SampleRoute5 extends State<SampleRoute5>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('샘플 라우터 5'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(Get.arguments),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('메인으로 이동')
              ),
            ],
          ),
        )
    );
  }
}