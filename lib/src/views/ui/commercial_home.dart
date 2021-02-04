import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class Commercial extends StatelessWidget {
  List listQuotes  = [];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: reusableWidgets.header(isLargeScreen),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      button("Nouveau devis", context),
                      button("Nouveau client", context),
                    ]
                  ),
                rowHeadQuotes(),
                Row(
                    children: <Widget>[
                      Text(''),
                      Divider(color: Colors.blue[800]),
                    ]
                ),
                // Generate ListQuotes in view
                for ( var quote in listQuotes ) rowQuotes(quote),
              ]

            )
        // child: SearchBar(),
        ),
      ),

      //Partie NavigationBar (bas de l'écran)
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Color(0xFF186AA5),
        iconSize: 50,
        //onTap: _onItemTapped,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Container button(String text, context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 3.3,
      margin: new EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: mainBlue),
        onPressed: () {},
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(text),
        ),
      ),
    );
  }


  Row rowQuotes(quote){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.blue[800],
            onPressed: () {},//quote.Id
          ),
          Text(quote[0]),
          Text('01/04/2020'),
          Text('John Smith'),
          Text('Payement en attente'),
        ]
    );
  }

  Row rowHeadQuotes(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Afficher'),
          Text('Numéro de commande'),
          Text('Date'),
          Text('Client'),
          Text('Status'),
        ]
    );
  }

}