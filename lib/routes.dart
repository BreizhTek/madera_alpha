import 'package:flutter/widgets.dart';
import 'package:madera_prototype/src/views/ui/client_list.dart';
import 'package:madera_prototype/src/views/ui/commercial_step_1.dart';
import 'package:madera_prototype/src/views/ui/commercial_step_2.dart';
import 'package:madera_prototype/src/views/ui/commercial_step_4.dart';
import 'package:madera_prototype/src/views/ui/lists/ranges.dart';
import 'package:madera_prototype/src/views/ui/login.dart';
import 'package:madera_prototype/src/views/ui/module_list.dart';
import 'package:madera_prototype/src/views/ui/project_list.dart';
import 'package:madera_prototype/src/views/ui/test.dart';
import 'package:madera_prototype/src/views/ui/commercial_home.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => Login(),
  "/test": (BuildContext context) => Test(),

  "/commercial": (BuildContext context) => Commercial(),
  "/commercial_1": (BuildContext context) => CommercialStep1(),
  "/commercial_2": (BuildContext context) => CommercialStep2(),
  "/commercial_4": (BuildContext context) => CommercialStep4(),
  "/clients_list": (BuildContext context) => ClientsList(),
  "/projects_list": (BuildContext context) => ProjectsList(),
  "/modules_list": (BuildContext context) => ModulesList(),
  "/commercial/add/client": (BuildContext context) => Commercial(),


  "/commercial/ranges": (BuildContext context) => Ranges(),
};