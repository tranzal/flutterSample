
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroEx extends StatelessWidget {
  HeroEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 확대'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'assets/ic_launcher.png',
          width: 100,
          onTap: () {
            Get.to(NextPage(imgAsset: 'assets/ic_launcher.png'));
          },
        ),
      )
    );
  }
}

class NextPage extends StatelessWidget {
  final String imgAsset;
  NextPage({Key? key, required this.imgAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.white,
          child: PhotoHero(
            photo: imgAsset,
            width: 300,
            onTap: () {
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}

//photohero를 사용하기 위해선 아래가 필수
class PhotoHero extends StatelessWidget {
  PhotoHero({ Key? key, required this.photo, required this.onTap, required this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
