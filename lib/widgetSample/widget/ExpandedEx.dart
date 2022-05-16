import 'package:blog/widgetSample/widget/AppbarEx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('컨테이너 확장'),
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              )),
              Flexible(
                flex: 1,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green, borderRadius: BorderRadius.circular(10)),
                    ),
                  )
              ),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(10)
                  ),
                )
              )
            ],
          )
        )
    );
  }
}

/*
확장 할라면 Expanded
Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(10)
                  ),
                )
              )
 */