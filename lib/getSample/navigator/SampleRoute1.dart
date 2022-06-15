

import 'package:blog/channel_sample.dart';
import 'package:blog/getSample/navigator/GetNavigatorSample.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleRoute1 extends StatefulWidget{
  @override
  _SampleRoute1 createState() => _SampleRoute1();
}

class _SampleRoute1 extends State<SampleRoute1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('샘플 라우터 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
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


