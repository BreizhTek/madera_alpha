import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';
import 'package:madera_prototype/src/views/utils/style.dart';

class reusableWidgets {
  static AppBar header(String title) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        color: mainBlue,
        iconSize: isLargeScreen ? 45 : 30,
        icon: Icon(Icons.wifi),
        onPressed: () {},
      ),
      backgroundColor: mainWhite,
      centerTitle: true,
      title: ThemeText.appBarTitle(title),
    );
  }
}
