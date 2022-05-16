import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class SpreadOperatorEx extends StatefulWidget {
  @override
  State<SpreadOperatorEx> createState() => _SpreadOperatorEx();
}

class _SpreadOperatorEx extends State<SpreadOperatorEx> {

  final bool showItem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('스프레드'),
        ),
        body: ListView(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
            ),
            if(showItem) ...[
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)
                ),
              )
            ] else ...[

            ],
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)
              ),
            )
          ],
        )
    );
  }
}