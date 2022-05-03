

import 'package:blog/getSample/navigator/GetNavigatorSample.dart';
import 'package:blog/getSample/statement/CounterController.dart';
import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleRoute4 extends StatefulWidget{
  @override
  _SampleRoute4 createState() => _SampleRoute4();
}

class _SampleRoute4 extends State<SampleRoute4>{
  int radioVal = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('샘플 라우터 4'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Radio(
                    groupValue: radioVal,
                    value: 0,
                    onChanged: (value) {
                      setState(() {
                        radioVal = value as int;
                      });
                    },
                  ),
                  const Text('0'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    groupValue: radioVal,
                    value: 1,
                    onChanged: (value) {
                      setState(() {
                        radioVal = value as int;
                      });
                    },
                  ),
                  const Text('1')
                ],
              ),
              Row(
                children: [
                  Radio(
                    groupValue: radioVal,
                    value: 2,
                    onChanged: (value) {
                      setState(() {
                        radioVal = value as int;
                      });
                    },
                  ),
                  const Text('2')
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back(result: radioVal);
                  },
                  child: const Text('메인으로 이동')
              ),
            ],
          ),
        )
    );
  }
}