import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[
        observer,
      ],
      home: MyHomePage(title: 'Flutter Demo Home Page', analytics: analytics, observer: observer),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.analytics, required this.observer})
      : super(key: key);
  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = '';

  void setMessage(String message) {
    setState(() {
      this.message = message;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendAnalyticsEvent,
        tooltip: 'event add',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> sendAnalyticsEvent() async {
    await widget.analytics.logEvent(
        name: 'test_event',
        parameters: <String, dynamic>{
          'string': 'string',
          'int': 42,
          'long': 12345678910,
          'double': 42.0,
          'bool': true,
        },
    );
    setMessage('logEvent Success');
  }
}
