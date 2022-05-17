import 'package:flutter/material.dart';

class PositionedTransitionEx extends StatefulWidget {
  PositionedTransitionEx({Key? key}) : super(key: key);

  @override
  _PositionedTransitionExState createState() => _PositionedTransitionExState();
}

class _PositionedTransitionExState extends State<PositionedTransitionEx> with TickerProviderStateMixin {

  late final AnimationController _container = AnimationController(
      duration: const Duration(seconds: 1),
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
          final Size biggest = constraints.biggest;
          
          final Animation<RelativeRect> _animation = RelativeRectTween(
            begin: RelativeRect.fromSize(Rect.fromLTRB(0, 0, smallLogo, smallLogo), biggest),
          );
          
          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/ic_launcher.png'),
              )
            ],
          );
        },
      ),
    );
  }
}
