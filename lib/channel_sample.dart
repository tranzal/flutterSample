import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static const platform = MethodChannel('com.sample.test');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("http://10.0.2.2:3000/")),
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(handlerName: 'Sample', callback: (args) {
            print("결과 : ${args[0]}");
            return callMethodChannel(args[0]['data']);
          });
        },
        onLoadStart: (controller, url) {},
        onLoadStop: (controller, url) {},
      ),
    );
  }

  Future<String> callMethodChannel(String data) async {
    var sendData = {
      "data" : data
    };
    try{
      return await platform.invokeMethod('sample', sendData);
    } on PlatformException catch(e) {
      log("method call error : $e");
      return "N";
    }
  }
}

