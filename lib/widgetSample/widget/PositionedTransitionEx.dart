import 'package:flutter/material.dart';

const double smallLogo = 100;
const double bigLogo = 200;

class PositionedTransitionEx extends StatefulWidget {
  PositionedTransitionEx({Key? key}) : super(key: key);

  @override
  _PositionedTransitionExState createState() => _PositionedTransitionExState();
}

class _PositionedTransitionExState extends State<PositionedTransitionEx> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 2),
    vsync: this
  )..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('위치이동'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final biggest = constraints.biggest;
          
          final _animation = RelativeRectTween(
            begin: RelativeRect.fromSize(const Rect.fromLTRB(0, 0, smallLogo, smallLogo), biggest),
            end: RelativeRect.fromSize(
                Rect.fromLTWH(biggest.width - bigLogo, biggest.height - bigLogo, bigLogo, bigLogo),
                biggest
            )
          ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
          
          return Stack(
            children: <Widget>[
              PositionedTransition(
                rect: _animation,
                child: Container(
                  color: Colors.black,
                  child: Image.asset('assets/ic_launcher.png',),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
