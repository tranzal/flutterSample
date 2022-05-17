import 'package:flutter/material.dart';

class SlideTransitionEx extends StatefulWidget {
  SlideTransitionEx({Key? key}) : super(key: key);

  @override
  _SlideTransitionExState createState() => _SlideTransitionExState();
}

class _SlideTransitionExState extends State<SlideTransitionEx> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(4,0),//속도
  ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn//어떻게 움직일 것인지
  )
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('박스 날라옴'),
      ),
      body: SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            color: Colors.red,
            child: const Text('박스'),
          ),
        ),
      ),
    );
  }
}
