import 'package:googleapis/servicemanagement/v1.dart';
import 'package:http/http.dart' as http;

class FirebaseAuthRemoteDataSource {
  //서버 구축 시 url 추가
  final String url = 'https://';

  Future<String> createCustomToken(Map<String, dynamic> user) async {
    final customTokenResponse = await http.post(Uri.parse(url), body: user);

    return customTokenResponse.body;
  }
}