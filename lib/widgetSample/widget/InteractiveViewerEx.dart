import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InteractiveViewerEx extends StatelessWidget {
  InteractiveViewerEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('클릭 했을때 이미지 같이 움직임'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(100),
                child: Image.asset('assets/ic_launcher.png'),

              )
          )
        ],
      ),
    );
  }
}
