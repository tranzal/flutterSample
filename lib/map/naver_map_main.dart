import 'dart:async';

import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

// https://api.ncloud-docs.com/docs/ai-naver-mapsgeocoding-geocode 참고
//https://guide.ncloud-docs.com/docs/naveropenapiv3-maps-android-sdk-v3-1-download
// https://blog.naver.com/websearch/220482884843 위도 경도 계산

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<NaverMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NaverMap(
          onMapCreated: _onMapCreated,

        ),
      ),
    );
  }

  void _onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

}