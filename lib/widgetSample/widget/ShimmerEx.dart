import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEx extends StatefulWidget {
  @override
  State<ShimmerEx> createState() => _ShimmerEx();
}

class _ShimmerEx extends State<ShimmerEx> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('아이폰 처럼 반짝임'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(child: LoadingListPage()),
            Flexible(child: SlideToUnlockpage()),
          ],
        )
    );
  }
}

class LoadingListPage extends StatefulWidget{
  @override
  State<LoadingListPage> createState() => _LoadingListPage();
}

class _LoadingListPage extends State<LoadingListPage> {
  bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  enabled: _enabled,
                  child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 48,
                                height: 48,
                                color: Colors.white,
                              ),
                              const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 8,
                                        color: Colors.white,
                                      ),
                                      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                                      Container(
                                        width: double.infinity,
                                        height: 8,
                                        color: Colors.white,
                                      ),
                                      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                                      Container(
                                        width: 40,
                                        height: 8,
                                        color: Colors.white,
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),
                      ),
                    itemCount: 5,
                  )
              )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _enabled = !_enabled;
                });
              },
              child: Text(
                  _enabled ? 'Stop' : 'Play',
                style: Theme.of(context).textTheme.button?.copyWith(
                  fontSize: 18,
                  color: _enabled ? Colors.redAccent : Colors.green
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
}

class SlideToUnlockpage extends StatefulWidget{
  @override
  State<SlideToUnlockpage> createState() => _SlideToUnlockpage();
}

class _SlideToUnlockpage extends State<SlideToUnlockpage>{
  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          'https://i.pinimg.com/736x/8f/b0/c6/8fb0c64d558f54f720397467d23cc5b8.jpg',
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 48,
          right: 0,
          left: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  DateFormat.Hm('ko-KR').format(time),
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                Text(
                  DateFormat.MMMEd('ko-KR').format(time),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              loop: 100, // 100번 반복 후 안됨
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const FaIcon(FontAwesomeIcons.chevronRight),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  const Text(
                      'Slide to unlock',
                    style: TextStyle(
                      fontSize: 28
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

}