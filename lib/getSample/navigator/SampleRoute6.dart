

import 'package:blog/getSample/navigator/GetNavigatorSample.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleRoute6 extends StatefulWidget{
  @override
  _SampleRoute6 createState() => _SampleRoute6();
}

class _SampleRoute6 extends State<SampleRoute6>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('샘플 라우터 6'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(Get.parameters['param'].toString()),
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