import 'package:blog/firebase_options.dart';
import 'package:blog/kakaoLogin/model/MainViewModelWithFirebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import 'kakao_login.dart';

const KAKAO_APP_KEY = '1df8e5bb209be69b57c45952cb55a19a';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  kakao.KakaoSdk.init(nativeAppKey: '${KAKAO_APP_KEY}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '카카오 로그인',
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
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카카오 로그인'),
      ),
      body: Center(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return  ElevatedButton(
                  onPressed: () async {
                    await viewModel.login();
                    setState((){});
                  },
                  child: const Text('Login')
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                      viewModel.user?.kakaoAccount?.profile?.profileImageUrl ??
                          '이미지 없음'),
                  Text('${viewModel.isLogined}'),
                  ElevatedButton(
                      onPressed: () async {
                        await viewModel.logout();
                        setState(() {});
                      },
                      child: const Text('Logout')
                  )
                ],
              );
            }
          }
        ),
      ),
    );
  }
}
