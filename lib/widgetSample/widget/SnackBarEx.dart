import 'package:blog/widgetSample/widget/AppbarEx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarEx extends StatefulWidget {

  @override
  State<SnackBarEx> createState() => _SnackBarEx();
}

class _SnackBarEx extends State<SnackBarEx> {

  final SnackBar _snackBar = SnackBar(
      content: const Text('스낵바 열렸어'),
    action: SnackBarAction(
      label: '실행',
      onPressed: () {
        print('탭함');
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('스낵바'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('스낵바'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            },
          ),
        )
    );
  }
}