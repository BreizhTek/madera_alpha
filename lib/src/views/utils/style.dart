import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainBlue = Color(0xFF186AA5);
const Color mainWhite = Color(0xFFFFFFFF);



class ThemeText {
  static Text title(bool isLargeScreen, String text){
    return Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
        fontSize: isLargeScreen ? 40 : 40,
        fontWeight: FontWeight.w500,
        color: mainBlue,
    ));
  }

  static Text subTitle(bool isLargeScreen, String text){
    return Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: isLargeScreen ? 24 : 24,
          fontWeight: FontWeight.w600,
          color: mainBlue,
        ));
  }

  static Text simpleText(bool isLargeScreen, String text){
    return Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: isLargeScreen ? 18 : 18,
          // fontWeight: FontWeight.w600,
          color: mainBlue,
        ));
  }



}