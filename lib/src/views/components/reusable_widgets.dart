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

 static bottomBar(){
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
     //onTap: _onItemTapped,
   );
 }

  static appBarList(){
    return AppBar(
      elevation: 0,
      leading: IconButton(
        color: mainWhite,
        iconSize: isLargeScreen ? 45 : 30,
        icon: Icon(Icons.arrow_back_ios_sharp),
        onPressed: () {},
      ),
      backgroundColor: mainBlue,
    );
  }
}
