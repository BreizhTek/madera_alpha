import 'package:flutter/material.dart';

class appSetting {

  bool isLargeScreen;

  static bool getDeviceSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width > 600 ? true : false;
  }
}