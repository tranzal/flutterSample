import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
            ElevatedButton(
              onPressed: () {
                openSetting(context: context);
              },
              child: const Text('확인 버튼만 있는거'),
            ),
            ElevatedButton(
              onPressed: () {
                backButton(context: context);
              },
              child: const Text('예 아니요 버튼'),
            ),
            ElevatedButton(
              onPressed: () {
                titleOpenAlert(context: context);
              },
              child: const Text('확인 버튼만 있는거'),
            )

          ],
        ),
      ),
    );
  }
}

Future<bool> openSetting({required BuildContext context}) async {
  return (await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 20, bottom: 20),
                    child: Text(
                      '이쁜 모양의 샘플',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(Future.value(true));
                    },
                    child: InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        decoration: const BoxDecoration(
                          color: Color(0xff31539F),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "확인",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )) ??
      false;
}

Future<bool> backButton({required BuildContext context}) async {
  return (await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        contentPadding: const EdgeInsets.only(top: 10.0),
        content: SizedBox(
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20, bottom: 20),
                child: Text('앱을 종료하시겠습니까?', textAlign: TextAlign.center,),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap:() {
                        Navigator.of(context).pop(Future.value(false));
                      } ,
                      child: Container(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        decoration: const BoxDecoration(
                          color: Color(0xfddddddd),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          '아니요',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:() {
                        Navigator.of(context).pop(Future.value(true));
                      } ,
                      child: Container(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        decoration: const BoxDecoration(
                          color: Color(0xff31539F),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          '예',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  )) ??
      false;
}

Future<bool> titleOpenAlert({required BuildContext context}) async {

  var myColor = const Color(0xff00bfa5);

  return (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: Container(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Rate',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          color: myColor,
                          size: 30.0,
                        ),
                        Icon(
                          Icons.star_border,
                          color: myColor,
                          size: 30.0,
                        ),
                        Icon(
                          Icons.star_border,
                          color: myColor,
                          size: 30.0,
                        ),
                        Icon(
                          Icons.star_border,
                          color: myColor,
                          size: 30.0,
                        ),
                        Icon(
                          Icons.star_border,
                          color: myColor,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 4.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add Review',
                      border: InputBorder.none,
                    ),
                    maxLines: 8,
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      color: myColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0)),
                    ),
                    child: const Text(
                      'Rate Product',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      })) ??
      false;
}