import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("http://10.0.2.2:3000/")),
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

