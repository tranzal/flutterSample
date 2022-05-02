
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  late User user;

  void userDataInit(User user){
    this.user = user;
    update();
  }
}