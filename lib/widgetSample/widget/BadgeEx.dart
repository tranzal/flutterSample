import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeEx extends StatefulWidget {
  @override
  State<BadgeEx> createState() => _BadgeEx();
}

class _BadgeEx extends State<BadgeEx> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('뱃지'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('뱃지 증가'),
                    onPressed: () {
                      setState(() {
                        _count++;
                      });
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.remove),
                    label: const Text('뱃지 감소'),
                    onPressed: () {
                      setState(() {
                        _count--;
                      });
                    },
                  )
                ],
              ),
            ),
            Badge(
              showBadge: _count != 0 ? true : false ,
              position: const BadgePosition(top: 0, end: 0),
              badgeContent: Text(
                  _count.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              animationDuration: const Duration(microseconds: 300),
              animationType: BadgeAnimationType.scale,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag)
              ),
            )
          ],
        )
    );
  }
}