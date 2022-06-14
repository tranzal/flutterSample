import 'dart:async';

import 'package:blog/socketMessage/controller/socket_stream_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
StreamSocket streamSocket = StreamSocket();

void main() {
  runApp(const MyApp());
  connectAndListen();
}

void connectAndListen(){
  var socket = io.io('http://10.0.2.2:3500/some',
      io.OptionBuilder()
          .setTransports(['websocket']).build());
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });

  socket.on('fromServer', (data) => print(data));

  //When an event recieved from server, data is added to the stream
  socket.on('event', (data) => streamSocket.addResponse);
  socket.onDisconnect((_) => print('disconnect'));

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
      body: StreamBuilder(
          stream: streamSocket.getResponse,
        builder: (context, snapshot) {
          return Container(
            child: Text(snapshot.data.toString()),
          );
        },
      ),
    );
  }


}

