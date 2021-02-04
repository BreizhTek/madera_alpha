import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class Commercial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AsyncStatefulWidget(),
    );
  }
}

class AsyncStatefulWidget extends StatefulWidget {
  AsyncStatefulWidget({Key key}) : super(key: key);

  @override
  _AsyncStatefulWidget createState() => _AsyncStatefulWidget();
}

class _AsyncStatefulWidget extends State<AsyncStatefulWidget> {
  List<ContentType> _quotesList;

  Future<bool> getQuotesList () async {
    this._quotesList = await Api.getQuotes();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: reusableWidgets.header(''),
      bottomNavigationBar: reusableWidgets.bottomBar(),

      body: SafeArea(
        child: FutureBuilder<bool> (
          future: this.getQuotesList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: rowQuotes(),
                  )
                // child: SearchBar(),
              );
            } else {
              return Container(
              );
            }
          }
        )
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Container button(String text, context, action) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 3.3,
      margin: new EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: mainBlue),
        onPressed: () {
          if(action != false) {
            action();
          }
        },
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(text),
        ),
      ),
    );
  }

  void goToStepOne() {
    Navigator.pushNamed(context, "/commercial_1");
  }

  List<Widget> rowQuotes(){
      List<Widget> rows = [];
      rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("Nouveau devis", context, goToStepOne),
              button("Nouveau client", context, false),
            ]
          )
      );
      rows.add(rowHeadQuotes());
      rows.add(
          Row(
              children: <Widget>[
                Text(''),
                Divider(color: Colors.blue[800]),
              ]
          )
      );
      for(var i=0; i<_quotesList.length; i++) {
        rows.add(
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.blue[800],
                    onPressed: () {},
                  ),
                  Text(_quotesList[i].data['Ammount'].toString()),
                  Text(_quotesList[i].data['Create']),
                  Text(_quotesList[i].data['client']['Firstname'] +' ' +_quotesList[i].data['client']['Lastname'] ),
                  Text(_quotesList[i].data['status']['Designation']),
                ]
            )
        );
      }
      return rows;
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