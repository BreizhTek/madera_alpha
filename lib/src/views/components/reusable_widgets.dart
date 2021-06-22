import 'dart:io';

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

 static bottomBar(BuildContext context){

   int selectedIndex = 0;

   return BottomNavigationBar(
     backgroundColor: Colors.white,
     items: const <BottomNavigationBarItem>[
       BottomNavigationBarItem(
         icon: Icon(Icons.file_copy),
         label: '',
       ),
       BottomNavigationBarItem(
         icon: Icon(Icons.home),
         label: '',
       ),
       BottomNavigationBarItem(
         icon: Icon(Icons.exit_to_app),
         label: '',
       ),
     ],
     //currentIndex: _selectedIndex,
     selectedItemColor: mainBlue,
     iconSize: isLargeScreen ? 50 : 30,
     currentIndex: selectedIndex,
     onTap: (index) {
       print(index);
       if(index == 0){
         Navigator.pushNamed(context, '/commercial_1');
       }else if(index == 1){
         Navigator.pushNamed(context, '/commercial_home');
       }else{
          showAlertDialog(context);
         // exit(0);
       }
     },
   );
 }

 static showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Quitter"),
      onPressed:  () {
        exit(0);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continuer"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Voulez-vous quittez l'application ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static appBarList(String title, BuildContext context){
    return AppBar(
      elevation: 0,
      leading: IconButton(
        color: mainWhite,
        iconSize: isLargeScreen ? 45 : 30,
        icon: Icon(Icons.arrow_back_ios_sharp),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: mainBlue,
      centerTitle: true,
      title: ThemeText.appBarTitle2(title),
    );
  }

  }

