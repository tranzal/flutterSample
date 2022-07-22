import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

//인앱 웹뷰에서 intent처리시 화면도 이동하고 앱도 켜지는 현상이 발생함 해당 문제는 PG결제시에 발생하는 것으로 보임
//왜인지 모르겠지만 정상 작동함 버전 문제인것으로 보임
void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //옵션을 선언할 수 있다.
  final InAppWebViewGroupOptions _inAppWebViewOptions = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      clearCache: true, // 앱을 켤 때마다 캐시 삭제.
    ),
    ios: IOSInAppWebViewOptions(

    ),
    android: AndroidInAppWebViewOptions(

    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialOptions: _inAppWebViewOptions,
        initialUrlRequest: URLRequest(url: Uri.parse('http://10.0.2.2:3000/')),
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(handlerName: 'Sample', callback: (args) {
            print("호출!");
            print("결과 : $args");
          });

          controller.addJavaScriptHandler(handlerName: 'Test', callback: (args) {
            print("Test호출!");
            return "Y";
          });
        },
        onLoadStart: (controller, url) {},
        onLoadStop: (controller, url) {},
      ),
    );
  }
}

