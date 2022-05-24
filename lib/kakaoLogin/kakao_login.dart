
import 'package:blog/kakaoLogin/abstact/SocialLogin.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if(isInstalled){
        try{
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch(error) {
          return false;
        }
      } else {
        try{
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch(error) {
          return false;
        }
      }
    } catch(error) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch(error) {
      return false;
    }
  }

}