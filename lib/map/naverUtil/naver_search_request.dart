import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:naver_map_plugin/naver_map_plugin.dart';

class NaverSearchRequest {
  final addressSearchUrl = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode';
  final addressChangeUrl = 'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc';
  final clientId = 'ClientId';
  final clientSecretKey = 'SecretKey';

  Future<dynamic> searchPostRequest(String name, LatLng search) async {
   var addressChangeResponse = await http.get(
     Uri.parse('$addressChangeUrl?request=coordsToaddr&coords=${search.longitude},${search.latitude}&orders=roadaddr&output=json&sourcecrs=epsg:4326',),
     // Uri.parse('$addressChangeUrl?request=coordsToaddr&coords=127.1234308,37.3850143&orders=roadaddr&output=json&sourcecrs=epsg:4326',),
     headers: <String, String> {
       'X-NCP-APIGW-API-KEY-ID' : clientId,
       'X-NCP-APIGW-API-KEY' : clientSecretKey
     },
   );
   var changeBodyList = jsonDecode(addressChangeResponse.body);

    var addressSearchResponse = await http.get(
      // Uri.parse('$url?query=$name&coordinate=${search.longitude},${search.latitude}',),
      Uri.parse('$addressSearchUrl?query=${changeBodyList['results'][0]['region']['area1']['name'].toString()} ${changeBodyList['results'][0]['region']['area2']['name'].toString()} ${changeBodyList['results'][0]['land']['name'].toString()} ${changeBodyList['results'][0]['land']['number1'].toString()}',),
      headers: <String, String> {
        'X-NCP-APIGW-API-KEY-ID' : clientId,
        'X-NCP-APIGW-API-KEY' : clientSecretKey
      },
    );
    var searchBodyList = jsonDecode(addressSearchResponse.body);
    debugPrint(searchBodyList.toString());
    // debugPrint(searchBodyList['status']);
    // debugPrint(searchBodyList['meta'].toString());
    // debugPrint(searchBodyList['addresses'].toString());
    return searchBodyList;
  }

  Future<String> searchGetRequest(String name, LatLng search) async {
    var addressChangeResponse = await http.post(
      Uri.parse('$addressChangeUrl?request=coordsToaddr&coords=${search.longitude},${search.latitude}&orders=roadaddr&output=json&sourcecrs=epsg:4326',),
      // Uri.parse('$addressChangeUrl?request=coordsToaddr&coords=127.1234308,37.3850143&orders=roadaddr&output=json&sourcecrs=epsg:4326',),
      headers: <String, String> {
        'X-NCP-APIGW-API-KEY-ID' : clientId,
        'X-NCP-APIGW-API-KEY' : clientSecretKey
      },
    );
    var changeBodyList = jsonDecode(addressChangeResponse.body);

    var addressSearchResponse = await http.post(
      // Uri.parse('$url?query=$name&coordinate=${search.longitude},${search.latitude}',),
      Uri.parse('$addressSearchUrl?query=${changeBodyList['results'][0]['region']['area1']['name'].toString()} ${changeBodyList['results'][0]['region']['area2']['name'].toString()} ${changeBodyList['results'][0]['land']['name'].toString()} ${changeBodyList['results'][0]['land']['number1'].toString()}',),
      headers: <String, String> {
        'X-NCP-APIGW-API-KEY-ID' : clientId,
        'X-NCP-APIGW-API-KEY' : clientSecretKey
      },
    );

    var searchBodyList = jsonDecode(addressSearchResponse.body);
    debugPrint(searchBodyList.toString());
    // debugPrint(searchBodyList['status']);
    // debugPrint(searchBodyList['meta'].toString());
    // debugPrint(searchBodyList['addresses'].toString());
    return searchBodyList;
  }
}