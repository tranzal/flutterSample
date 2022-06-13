import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

//일반적인 상황에 사용
class CounterController extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update();
  }
}

// 워커를 사용해야 한다면 사용
class ReactiveController extends GetxController {
  RxInt count0 = 0.obs;
  var count1 = 0.obs;
  var user = User(id: 1, name: '나나나').obs;

  List testList = [1, 2, 3, 4, 5].obs;

  get sum => count0.value + count1.value;

  void change({required int id, required String name}) {
    user.update((val) {
      val?.name = name;
      val?.id = id;
    });
  }

  @override
  void onInit() {
    super.onInit();

    ever(count0, (_) { // 동작을 할 때마다 실행
      print('EVER : 카운트0이 변경될 때마다 실행');
    });

    once(count0, (_) { //동작을 실행한 처음에 1번만 실행
      print('ONCE : 처음으로 카운트0이 변경될 때 실행');
    });

    debounce(count0, (_) { // 설정한 시간 이내에 재 동작을 안하면 실행
      print('DEBOUNCE : 1초간 디바운스 한 후에 실행');
    },
    time: const Duration(milliseconds: 1000));

    interval(count0, (_) { // 행동이 지속적으로 동착 할때 설정한 시간 마다 실행
      print('INTERVAL : 1초간 인터벌 한 후에 실행');
    },
        time: const Duration(milliseconds: 1000));
  }
}

class User {
  int id;
  String name;

  User({required this.id, required this.name});
}
