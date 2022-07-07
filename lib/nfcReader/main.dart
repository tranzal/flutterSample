import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';



//AndroidManifest.xml에 <uses-permission android:name="android.permission.NFC"/> 작성
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('NfcManager Plugin Example')),
        body: SafeArea(
          child: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) => ss.data != true
                ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
                : Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    constraints: const BoxConstraints.expand(),
                    decoration: BoxDecoration(border: Border.all()),
                    child: SingleChildScrollView(
                      child: ValueListenableBuilder<dynamic>(
                        valueListenable: result,
                        builder: (context, value, _) =>
                            Text('${value ?? ''}'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: GridView.count(
                    padding: const EdgeInsets.all(4),
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: [
                      ElevatedButton(
                          onPressed: _tagRead,
                          child: const Text('Tag Read')),
                      ElevatedButton(
                          onPressed: _ndefWrite,
                          child: const Text('Ndef Write')),
                      ElevatedButton(
                          onPressed: _ndefWriteLock,
                          child: const Text('Ndef Write Lock')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // NFC 정보 가져옴
  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      await NfcManager.instance.stopSession();
    });
  }

  // NFC를 이용하여 카드 정보 작성
  void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        await NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      var message = NdefMessage([
        NdefRecord.createText('Hello World!'),
        NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Wriawait te"';
        await NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        await NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  //NFC 작성 잠금
  void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        result.value = 'Tag is not ndef';
        await NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }

      try {
        await ndef.writeLock();
        result.value = 'Success to "Ndef Write Lock"';
        await NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        await NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }
}