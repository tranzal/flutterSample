import 'package:flutter/material.dart';

class InkWellEx extends StatefulWidget {
  InkWellEx({Key? key}) : super(key: key);

  @override
  _InkWellExState createState() => _InkWellExState();
}

class _InkWellExState extends State<InkWellEx> {
  double sideLength = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('눌렀을 때 표시됨'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          height: sideLength,
          width: sideLength,
          child: Material(
            color: Colors.cyan,
            child: InkWell(
              onTap: () {
                setState(() {
                  sideLength == 50 ? sideLength = 300 : sideLength = 50;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
