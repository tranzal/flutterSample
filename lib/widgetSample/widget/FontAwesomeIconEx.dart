import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//https://fontawesome.com/search?s=solid%2Cbrands 에서 검색하면 볼수있음
class FontAwesomeIconEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('아이콘 많이'),
        ),
        body: const Center(
          child: FaIcon(FontAwesomeIcons.arrowsLeftRightToLine),
        )
    );
  }
}