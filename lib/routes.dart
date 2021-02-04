import 'package:flutter/widgets.dart';
import 'package:madera_prototype/src/views/ui/commercial_step_1.dart';
import 'package:madera_prototype/src/views/ui/login.dart';
import 'package:madera_prototype/src/views/ui/test.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => Login(),
  "/test": (BuildContext context) => Test(),
  "/commercial_1": (BuildContext context) => CommercialStep1(),
  // "/commercial": (BuildContext context) => Commercial(),
};