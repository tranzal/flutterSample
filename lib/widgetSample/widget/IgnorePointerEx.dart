import 'package:flutter/material.dart';

class IgnorePointerEx extends StatefulWidget {
  IgnorePointerEx({Key? key}) : super(key: key);

  @override
  _IgnorePointerExState createState() => _IgnorePointerExState();
}

class _IgnorePointerExState extends State<IgnorePointerEx> {
  bool ignoring = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('클릭 막기'),
        actions: <Widget>[
          IconButton(
          onPressed: () {
            setState(() {
              ignoring = !ignoring;
            });
          },
          icon: ignoring ? const Icon(Icons.remove) : const Icon(Icons.add)
          )
        ],
      ),
      body: Center(
        child: IgnorePointer(
          ignoring: ignoring,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Ignoring: $ignoring',
                textScaleFactor: 2,
              ),
              ElevatedButton(
                  onPressed: (){
                  },
                  child: const Text('클릭')
              )
            ],
          ),
        ),
      ),
    );
  }
}
