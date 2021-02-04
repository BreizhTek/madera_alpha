import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/material.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';

class ClientsList extends StatefulWidget {
  ClientsList({Key key}) : super(key: key);

  @override
  _ClientsList createState() => _ClientsList();
}

class _ClientsList extends State<ClientsList> {
  List<ContentType> _clientsList;

  Future<bool> getClientsList () async {
    this._clientsList = await Api.getClients();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: reusableWidgets.header(''),
      bottomNavigationBar: reusableWidgets.bottomBar(),
      body: SafeArea(
          child: FutureBuilder<bool> (
              future: this.getClientsList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: rowClients(),
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


  List<Widget> rowClients(){
    List<Widget> rows = [];
    rows.add(
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("Nouveau devis", context),
              button("Nouveau client", context),
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
    for(var i=0; i<_clientsList.length; i++) {
      rows.add(
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.blue[800],
                  onPressed: () {},//quote.Id
                ),
                Text(_clientsList[i].data['Ammount'].toString()),
                Text(_clientsList[i].data['Create']),
                Text(_clientsList[i].data['client']['Firstname'] +' ' +_clientsList[i].data['client']['Lastname'] ),
                Text(_clientsList[i].data['status']['Designation']),
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