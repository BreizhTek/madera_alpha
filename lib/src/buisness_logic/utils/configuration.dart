import 'package:flutter/material.dart';

bool isLargeScreen = false;

class appSetting {

  appSetting(BuildContext context){
   isLargeScreen = getDeviceSize(context);
  }

  static bool getDeviceSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width > 600 ? true : false;
  }
}