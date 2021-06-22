import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';

class ModulesList extends StatefulWidget {
  ModulesList({Key key}) : super(key: key);

  @override
  _ModulesList createState() => _ModulesList();
}

class _ModulesList extends State<ModulesList> {
  List<ContentType> _modulesList;

  Future<bool> getClientsList() async {
    this._modulesList = await Api.getClients();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: reusableWidgets.appBarList("Module disponible", context),
      bottomNavigationBar: reusableWidgets.bottomBar(context),
      body: SafeArea(
          child: FutureBuilder<bool>(
              future: this.getClientsList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: rowClients(),
                            ),
                          ]
                      )
                    // child: SearchBar(),
                  );
                } else {
                  return Container();
                }
              })),
    );
  }

  Container button(String text, context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.3,
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

  List<Widget> rowClients() {
    List<Widget> rows = [];

    rows.add(
        Container(
          width: isLargeScreen ? MediaQuery.of(context).size.width / 2.2 : MediaQuery.of(context).size.width / 1.2,
          padding: isLargeScreen ? const EdgeInsets.symmetric(horizontal: 5, vertical: 20) : const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: isLargeScreen ? EdgeInsets.symmetric(horizontal: 5, vertical: 10) : EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        )
    );

    rows.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // child: SearchBar(),
        )
    );
    for (var i = 0; i < _modulesList.length; i++) {

      rows.add(Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
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
                    child:  IconButton(
                      icon: Icon(Icons.add_outlined),
                      color: mainBlue,
                      onPressed: () {}, //quote.Id
                    ),
                  ),
                  Container(
                    width: isLargeScreen
                        ? MediaQuery.of(context).size.width / 5
                        : MediaQuery.of(context).size.width / 5,
                    child: simpleText(
                        _modulesList[i].data['Label'].toString(), 15),
                  ),
                  Container(
                    width: isLargeScreen
                        ? MediaQuery.of(context).size.width / 5
                        : MediaQuery.of(context).size.width / 5,
                    child: simpleText(
                        _modulesList[i].data['Height'].toString(), 15),
                  ),
                  Container(
                    width: isLargeScreen
                        ? MediaQuery.of(context).size.width / 5
                        : MediaQuery.of(context).size.width / 5,
                    child: simpleText(
                        _modulesList[i].data['Width'].toString(), 15),
                  ),

                ]),
          )));
    }


    return rows;
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
