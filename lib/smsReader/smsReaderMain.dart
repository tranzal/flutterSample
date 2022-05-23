import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';


//받은 sms를 읽고 sms에서 인증번호 가져오기
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int i) {
              var message = _messages[i];

              return ListTile(
                title: Text('${message.sender} [${message.date}]'),
                subtitle: Text('${message.body}'),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var permission = await Permission.sms.status;
            if (permission.isGranted) {
              final messages = await _query.querySms(
                  kinds: [SmsQueryKind.inbox, SmsQueryKind.sent,SmsQueryKind.draft],
                  address: '01087481339',// 특정 번호를 입력하면 해당 번호 목록만 받아오기 가능
                  // address: '+254712345789',
                  count: 1
              );
              debugPrint('sms inbox messages: ${messages.length}');
              for(SmsMessage tempSms in messages){
                var index = tempSms.body?.indexOf('CertNo');
                var certNo = tempSms.body?.substring(index! + 7, index + 13);
                debugPrint(certNo);

                await FlutterClipboard.copy(certNo!);
              }
              setState(() => _messages = messages);
            } else {
              await Permission.sms.request();
            }
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}