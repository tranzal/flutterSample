

import 'package:blog/getSample/navigator/GetNavigatorSample.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleRoute7 extends StatefulWidget{
  @override
  _SampleRoute7 createState() => _SampleRoute7();
}

class _SampleRoute7 extends State<SampleRoute7>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('샘플 라우터 7'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(Get.parameters['id'].toString()),
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