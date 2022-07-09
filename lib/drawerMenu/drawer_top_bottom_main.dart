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
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.menu),
              );
            },
          ),
        ],
      ),
      endDrawer: endDrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }

  Drawer endDrawerWidget() {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            // 그림 추가 하려면 아래 코드 추가
            // currentAccountPicture: ClipOval(
            //   child: Material(
            //     color: Colors.grey.withOpacity(0.3),
            //     child: Image.network(
            //       '이미지 URL',
            //       fit: BoxFit.fitHeight,
            //     ),
            //   ),
            // ),
            accountName: Text('샘플'),
            accountEmail: Text('sample@gmail.com'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SwitchListTile(
                  value: switchValue,
                  onChanged: (newValue) {
                  },
                  title: const Text(
                    '알림받기',
                    style: TextStyle(
                        fontSize: 17
                    ),
                  ),
                  tileColor: const Color(0xFFFAFAFA),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: context.width,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color(0xFFEEEDED),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: TextButton(
              onPressed: () {
                confirm(context, '로그아웃 하시겠습니까?');
              },
              child: Row(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.logout),
                  ),
                  Text('로그아웃', style: TextStyle(
                      fontSize: 17
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void confirm(BuildContext context, String contentText) {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(contentText),
            actions: [
              TextButton(
                  onPressed: () async {
                  },
                  child: const Text('확인')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('취소'))
            ],
          );
        }
    );
  }
}
