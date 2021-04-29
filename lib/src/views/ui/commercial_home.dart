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
    return Scaffold(
        body: AsyncStatefulWidget(),
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
          Navigator.pushNamed(context, action);
        },
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(text),
        ),
      ),
    );
  }

  List<Widget> rowQuotes(){
      List<Widget> rows = [];
      rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("Nouveau devis", context, "/commercial_1"),
              button("Nouveau client", context, "/commercial_customer"),
            ]
          )
      );
      //rows.add(rowHeadQuotes());
      rows.add(
          Row(
              children: <Widget>[
                Text(''),
                Divider(color: Colors.blue[800]),
              ]
          )
      );
      for(var i=0; i<_quotesList.length; i++) {
        rows.add(Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  )]),
            margin: EdgeInsets.only(top: 10.0),
            width: isLargeScreen
                ? MediaQuery.of(context).size.width / 1
                : MediaQuery.of(context).size.width / 1,
            child: OutlineButton(
              onPressed: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        color: mainBlue,
                      ),
                    ),
                    Container(
                      width: isLargeScreen
                          ? MediaQuery.of(context).size.width / 5
                          : MediaQuery.of(context).size.width / 3,
                      child: simpleText(
                          _quotesList[i].data['Ammount'].toString(), 15),
                    ),
                    Container(
                      width: isLargeScreen
                          ? MediaQuery.of(context).size.width / 5
                          : MediaQuery.of(context).size.width / 3,
                      child: simpleText(
                          _quotesList[i].data['Create'].toString(), 15),
                    ),
                    Container(
                      width: isLargeScreen
                          ? MediaQuery.of(context).size.width / 5
                          : MediaQuery.of(context).size.width / 3,
                      child: simpleText(
                          _quotesList[i].data['client']['Firstname'] + ' ' +_quotesList[i].data['client']['Lastname'] , 15),
                    ),
                    Container(
                      width: isLargeScreen
                          ? MediaQuery.of(context).size.width / 5
                          : MediaQuery.of(context).size.width / 3,
                      child: simpleText(
                          _quotesList[i].data['status']['Designation'], 15),
                    ),

                  ]),
            )));
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


  Text simpleText(String text, double size) {
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: isLargeScreen ? size : size - 3,
          color: mainBlue,
          fontWeight: FontWeight.w400,
        ));
  }

}