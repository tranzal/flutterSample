import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _control = TextEditingController();
  var _data = 'String Here';

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _control.text));
  }

  void pasteFromClipboard() async {
    var cdata = await Clipboard.getData(Clipboard.kTextPlain);

    setState(() {
      _data = cdata?.text ?? 'got null...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Column(children: [
            TextField(
              controller: _control,
            ),
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: copyToClipboard,
            ),
            Text(_data),
            IconButton(
              icon: const Icon(Icons.paste),
              onPressed: pasteFromClipboard,
            )
          ]),
        ),
      ),
    );
  }
}