import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/routes.dart';


void main() => runApp(Madera());

/// This is the main application widget.
class Madera extends StatelessWidget {
  static const String _title = 'Madera prototype';
  bool isLargeScreen = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/commercial',
      routes: routes,
    );
  }
}