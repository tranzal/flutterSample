

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Get.snackbar('스낵바', '이것은 스낵바입니다.', snackPosition: SnackPosition.TOP);
              },
              icon: const Icon(Icons.add_alert)
          )
        ],
      ),
      body: const Center(
        child: Text(
          '앱바 예제',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}