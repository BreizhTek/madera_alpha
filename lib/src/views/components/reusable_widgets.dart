import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madera_prototype/src/views/utils/style.dart';

class reusableWidgets {

  static AppBar header(bool isLargeScreen) {
    return AppBar(
      backgroundColor: mainWhite,
      title: Container(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: IconButton(
            color: mainBlue,
            iconSize: isLargeScreen ? 45 : 30,
            icon: Icon(Icons.wifi),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
