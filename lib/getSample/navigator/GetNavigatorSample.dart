import 'package:blog/getSample/navigator/SampleRoute1.dart';
import 'package:blog/getSample/navigator/SampleRoute2.dart';
import 'package:blog/getSample/navigator/SampleRoute3.dart';
import 'package:blog/getSample/navigator/SampleRoute4.dart';
import 'package:blog/getSample/navigator/SampleRoute5.dart';
import 'package:blog/getSample/navigator/SampleRoute6.dart';
import 'package:blog/getSample/navigator/SampleRoute7.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetNavigatorSample());
}

class GetNavigatorSample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => GetNavigatorSample()
        ),
        GetPage(
            name: '/one',
            page: () => SampleRoute1()
        ),
        GetPage(
            name: '/two',
            page: () => SampleRoute2()
        ),
        GetPage(
            name: '/three',
            page: () => SampleRoute3()
        ),
        GetPage(
            name: '/six/:param',
            page: () => SampleRoute6()
        ),
        GetPage(
            name: '/seven',
            page: () => SampleRoute7()
        )
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('샘플'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SampleRoute1());
                  },
                  child: const Text('뒤로가기')
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SampleRoute2());
                  },
                  child: const Text('뒤로가기 시 해당 화면 빼고 뒤로가기')
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SampleRoute3());
                  },
                  child: const Text('전체 기록 삭제')
              ),
              const Divider(),
              ElevatedButton(
                  onPressed: () async {

                    final returnData = await Get.to(() => SampleRoute4());
                    print(returnData);
                  },
                  child: const Text('리턴 값 받기')
              ),
              ElevatedButton(
                  onPressed: () async {
                    Get.to(() => SampleRoute5(), arguments: '값 전달!');
                  },
                  child: const Text('아규먼트 전달')
              ),
              ElevatedButton(
                  onPressed: () async {
                    Get.to(() => SampleRoute1(), transition: Transition.fadeIn);
                  },
                  child: const Text('트렌지션(라우터 이동 시 화면 나오는 거)')
              ),
              ElevatedButton(
                  onPressed: () async {
                    Get.toNamed('/one');
                  },
                  child: const Text('이름으로 이동')
              ),
              ElevatedButton(
                  onPressed: () async {
                    Get.toNamed('/six/TTTT');
                  },
                  child: const Text('이름으로 이동 파람 값 가져 가기')
              ),
              ElevatedButton(
                  onPressed: () async {
                    Get.toNamed('/seven?id=하하하');
                  },
                  child: const Text('이름으로 이동 쿼리 파람 가져 가기')
              ),
              ElevatedButton(
                  onPressed: () async {
                    Get.snackbar(
                      '제목',
                      '내용',
                      snackPosition: SnackPosition.BOTTOM
                    );
                  },
                  child: const Text('스낵 바')
              ),
              ElevatedButton(
                  onPressed: () async {
                    await Get.defaultDialog(//Get.dialog로 커스텀도 가능
                      title: '다이어로그랴',
                      middleText: '경고!',
                    );
                  },
                  child: const Text('다이어로그')
              ),
              ElevatedButton(
                  onPressed: () async {
                    await Get.bottomSheet(
                      Container(
                        color: Colors.blue,
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.music_note),
                              title: const Text('Music'),
                              onTap: () => {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.videocam),
                              title: const Text('Video'),
                              onTap: () => {},
                            ),
                          ],
                        ),
                      )
                    );
                  },
                  child: const Text('바텀시트')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
