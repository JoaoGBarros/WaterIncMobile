import 'package:app/features/agua/widgets/agua_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'assets_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Colors.blue,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = [
    Text('home'),
    Text('search'),
    AguaList()
  ];
}
