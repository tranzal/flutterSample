import 'package:cloud_firestore/cloud_firestore.dart';
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
  QuerySnapshot<Object?>? querySnapshotGlobal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('sample').snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              if (snapshot.data != null) {
                return findStreamData(snapshot);
              } else {
                return const Center(
                  child: Text('내용 없음'),
                );
              }
            default:
              if(querySnapshotGlobal != null) {
                return findStreamData(snapshot);
              } else {
                return const Center(
                  child: Text('내용 없음'),
                );
              }
          }
        },
      ),
    );
  }

  Widget findStreamData(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    querySnapshotGlobal = snapshot.data;
    var snapList = snapshot.data!.docs.toList();
    return ListView.builder(
      itemCount: snapList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Text(snapList[index].get('title')),
        );
      },
    );
  }

}
