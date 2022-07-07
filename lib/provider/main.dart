import 'package:blog/provider/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create:  (context) => CounterController(),)
        ],
      child: const MyApp(),
    )
  );
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
      home: const MyHomePage(title: 'Provider 샘플'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterController _counterController1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _counterController1 = Provider.of<CounterController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counterController1.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () => _counterController1.add(),
            child: const Icon(Icons.add)
        ),
        ElevatedButton(
            onPressed: () => _counterController1.minus(),
            child: const Icon(Icons.remove)
        )
      ],
    );
  }
}
