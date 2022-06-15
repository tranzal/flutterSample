import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:blog/map/controller/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:vibration/vibration.dart';

// https://api.ncloud-docs.com/docs/ai-naver-mapsgeocoding-geocode 참고
//https://guide.ncloud-docs.com/docs/naveropenapiv3-maps-android-sdk-v3-1-download
// https://blog.naver.com/websearch/220482884843 위도 경도 계산

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();

  runApp(MyApp());
}





class MyApp extends StatefulWidget {
  final timerController = Get.put(TimerController());

  @override
  State<MyApp> createState() => _MyAppState();


  void timerSetting(ServiceInstance service) {
    DartPluginRegistrant.ensureInitialized();


    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    if (timerController.timer != null) {
      timerController.timer?.cancel();
    }

    timerController.timerChange(time: Timer.periodic(
        const Duration(milliseconds: 1000), (timer) async {
      debugPrint('--------------------------------------------------------------------------------------${timerController.latLng}');
      var result = await distanceResult(timerController.latLng!);
      debugPrint('background : ${result.toString()}');
      if (result < 0.25) {
        await Vibration.vibrate(duration: 1500);
        timerController.timer?.cancel();
      }
    }));
  }
}

class _MyAppState extends State<MyApp> {
  final timerController = Get.put(TimerController());

  static const MODE_ADD = 0xF1;
  static const MODE_REMOVE = 0xF2;
  static const MODE_NONE = 0xF3;
  int _currentMode = MODE_ADD;
  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    FlutterBackgroundService().invoke('stopService');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        bottom: true,
        top: true,
        left: true,
        right: true,
        child: Scaffold(
          appBar: AppBar(
              title: Text('${timerController.distance}m'),
          ),
          body: Column(
            children: <Widget>[
              _controlPanel(),
              _naverMap(),
            ],
          ),
        ),
      ),
    );
  }

  _controlPanel() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 추가
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentMode = MODE_ADD),
              child: Container(
                decoration: BoxDecoration(
                    color:
                    _currentMode == MODE_ADD ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 8),
                child: Text(
                  '추가',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                    _currentMode == MODE_ADD ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // 삭제
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentMode = MODE_REMOVE),
              child: Container(
                decoration: BoxDecoration(
                    color: _currentMode == MODE_REMOVE
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 8),
                child: Text(
                  '삭제',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _currentMode == MODE_REMOVE
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // none
          GestureDetector(
            onTap: () => setState(() {
              _currentMode = MODE_NONE;
            }),
            child: Container(
              decoration: BoxDecoration(
                  color:
                  _currentMode == MODE_NONE ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.clear,
                color: _currentMode == MODE_NONE ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _naverMap() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          NaverMap(
            onMapCreated: _onMapCreated,
            onMapTap: _onMapTap,
            markers: _markers,
            initLocationTrackingMode: LocationTrackingMode.Face,
            activeLayers: const [
              MapLayer.LAYER_GROUP_TRANSIT
            ],
            locationButtonEnable: true,
            onSymbolTap: _onSymbolTap,
          ),
        ],
      ),
    );
  }

  // ================== method ==========================

  void _onSymbolTap(LatLng? latLng, String? name) async {
    if (_currentMode == MODE_ADD) {
      if(_markers.isEmpty){
        _markers.add(Marker(
          markerId: DateTime.now().toIso8601String(),
          position: latLng,
          infoWindow: name,
          onMarkerTab: _onMarkerTap,
        ));
      }else if(_markers.length == 1) {
        _markers[0] = Marker(
          markerId: DateTime.now().toIso8601String(),
          position: latLng,
          infoWindow: name,
          onMarkerTab: _onMarkerTap,
        );
      }
      timerController.latLngChange(latlng: latLng!);
      final service = FlutterBackgroundService();
      var isRunning = await service.isRunning();
      if (isRunning) {
        service.invoke("stopService");
      } else {
        service.startService();
      }
      setState(() {});
    }
  }

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
  }

  //좌표 계산 식 https://ko.wikipedia.org/wiki/%EC%A7%80%EB%A6%AC%EC%A2%8C%ED%91%9C_%EA%B1%B0%EB%A6%AC
  //좌표 <-> 도분초 https://injunech.tistory.com/294
  void _onMapTap(LatLng latLng) async {
    if (_currentMode == MODE_ADD) {
      if(_markers.isEmpty){
        _markers.add(Marker(
          markerId: DateTime.now().toIso8601String(),
          position: latLng,
          onMarkerTab: _onMarkerTap,
        ));
      }else if(_markers.length == 1) {
        _markers[0] = Marker(
          markerId: DateTime.now().toIso8601String(),
          position: latLng,
          onMarkerTab: _onMarkerTap,
        );
      }
      timerController.latLngChange(latlng: latLng);
      final service = FlutterBackgroundService();
      var isRunning = await service.isRunning();
      if (isRunning) {
        service.invoke("stopService");
      } else {
        service.startService();
      }
      setState(() {});
    }
  }

  void _onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
    final service = FlutterBackgroundService();
    int pos = _markers.indexWhere((m) => m.markerId == marker!.markerId);
    setState(() {
      _markers[pos].captionText = '선택됨';
    });
    if (_currentMode == MODE_REMOVE) {
      service.invoke("stopService");
      setState(() {
        _markers.removeWhere((m) => m.markerId == marker!.markerId);
      });
    }
  }





}

Future<double> distanceResult(LatLng latLng) async {
  var deviceLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  var deviceLongitudeDegree = (deviceLocation.longitude).toInt();
  var deviceLongitudeMinute = ((deviceLocation.longitude - deviceLongitudeDegree) * 60).toInt();
  var deviceLongitudeSecond = ((deviceLocation.longitude - deviceLongitudeDegree) * 60 - deviceLongitudeMinute) * 60;

  var deviceLatitudeDegree = (deviceLocation.latitude).toInt();
  var deviceLatitudeMinute = ((deviceLocation.latitude - deviceLatitudeDegree) * 60).toInt();
  var deviceLatitudeSecond = ((deviceLocation.latitude - deviceLatitudeDegree) * 60 - deviceLatitudeMinute) * 60;

  var destinationLongitudeDegree = (latLng.longitude).toInt();
  var destinationLongitudeMinute = ((latLng.longitude - destinationLongitudeDegree) * 60).toInt();
  var destinationLongitudeSecond = ((latLng.longitude - destinationLongitudeDegree) * 60 - destinationLongitudeMinute) * 60;

  var destinationLatitudeDegree = (latLng.latitude).toInt();
  var destinationLatitudeMinute = ((latLng.latitude - destinationLatitudeDegree) * 60).toInt();
  var destinationLatitudeSecond = ((latLng.latitude - destinationLatitudeDegree) * 60 - destinationLatitudeMinute) * 60;

  var longitude = pow(((deviceLongitudeDegree - destinationLongitudeDegree).abs() * 88.9036 + (deviceLongitudeMinute - destinationLongitudeMinute).abs() * 1.4817 + (deviceLongitudeSecond - destinationLongitudeSecond).abs() * 0.0246), 2);
  var latitude = pow(((deviceLatitudeDegree - destinationLatitudeDegree).abs() * 111.3194 + (deviceLatitudeMinute - destinationLatitudeMinute).abs() * 1.8553 + (deviceLatitudeSecond - destinationLatitudeSecond).abs() * 0.0309), 2);
  var distance = sqrt(longitude + latitude);

  return distance;
}