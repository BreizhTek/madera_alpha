import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class CommercialStep1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommercialStep1State();
}

class _CommercialStep1State extends State<CommercialStep1> {
  String _title = "Création de devis";
  String _project;
  List<String> _clientList = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isLargeScreen = appSetting.getDeviceSize(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: reusableWidgets.header(_title),
        bottomNavigationBar: reusableWidgets.bottomBar(),
        body: Form(
          child: Center(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                if (isLargeScreen) dividerBlock(50),
                // divider(4, 4),
                title("Information chantier/projet"),
                divider(1.1, 4),
                Container(
                  width: isLargeScreen
                      ? MediaQuery.of(context).size.width / 1
                      : MediaQuery.of(context).size.width / 0.8,
                  child: mainView(),
                ),
              ],
            ),
          ),
        ));
  }

  List<Widget> clientsList() {
    List<Widget> rows = [];
    if (_clientList.isNotEmpty) {
      for (var i = 0; i < _clientList.length; i++) {
        rows.add(
          Container(
            // width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(3),
            padding: isLargeScreen ? EdgeInsets.all(12) : EdgeInsets.all(6),
            child: Text(_clientList[i].toString()),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0.0, 5)),
              ],
            ),
          ),
        );
      }
    }
    return rows;
  }

  Column mainView() {
    return Column(
      children: [
        if (isLargeScreen) dividerBlock(50),
        subTitle("Etape 1 - Information chantier/projet"),
        if (isLargeScreen) dividerBlock(100),
        Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textField("Vous devez renseigner un nom pour le devis",
                  "Nom du devis :"),
              listShow("Ajouter un client", "Nouveau client", "/clients_list"),
              Container(
                margin: isLargeScreen
                    ? EdgeInsets.only(top: 20, bottom: 2)
                    : EdgeInsets.only(top: 5),
                child: Wrap(
                  // children: clientsList(),
                  children: clientsList(),
                ),
              ),
              dateInput('Date'),
              // textField("Vous devez renseigner une date pour le devis",
              //     "Date devis"),
              listShow("Référence projet", "Nouveau projet", "/projects_list"),
              if (isLargeScreen) dividerBlock(50),
              buttons("Annuler", "Continuer"),
            ]),
      ],
    );
  }

  dateInput(String label) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 30.0, bottom: 3.0),
          alignment: Alignment.centerLeft,
          width: isLargeScreen
              ? MediaQuery.of(context).size.width / 1.5
              : MediaQuery.of(context).size.width / 1.3,
          child: simpleText(label, false)),
      Container(
          alignment: Alignment.centerLeft,
          width: isLargeScreen
              ? MediaQuery.of(context).size.width / 1.5
              : MediaQuery.of(context).size.width / 1.3,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.0, bottom: 3.0),
            height: 40,
            width: isLargeScreen
                ? MediaQuery.of(context).size.width / 5
                : MediaQuery.of(context).size.width / 1.3,
            child: TextButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // child: simpleText( selectedDate.day.toString() + '/' +  selectedDate.month.toString() + '/' + selectedDate.year.toString(), false),
                      child: classicText( selectedDate.day.toString() + '/' +  selectedDate.month.toString() + '/' + selectedDate.year.toString(), 10),
                    ),

                    Container(
                      child: Icon(Icons.date_range, color: mainBlue,),
                    )
                  ]),
              // ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0.0, 5)),
              ],
            ),
          ))
    ]);
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Column textField(String textEmptyMessage, String libel) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 30.0, bottom: 3.0),
          alignment: Alignment.centerLeft,
          width: isLargeScreen
              ? MediaQuery.of(context).size.width / 1.5
              : MediaQuery.of(context).size.width / 1.3,
          child: simpleText(libel, false)),
      Container(
        height: isLargeScreen ? 60 : 30,
        margin: new EdgeInsets.symmetric(vertical: 0.0),
        width: isLargeScreen
            ? MediaQuery.of(context).size.width / 1.5
            : MediaQuery.of(context).size.width / 1.3,
        child: TextFormField(
          enableSuggestions: true,
          autocorrect: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15.0),
          ),
          onChanged: (value) {},
          validator: (value) {
            if (value.isEmpty) {
              return textEmptyMessage;
            }
            return null;
          },
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(0.0, 5)),
          ],
        ),
      ),
    ]);
  }

  Container divider(double size_large, double size_small) {
    return Container(
      margin: isLargeScreen
          ? EdgeInsets.only(
              bottom: 40.0,
            )
          : EdgeInsets.only(
              bottom: 20.0,
            ),
      width: isLargeScreen
          ? MediaQuery.of(context).size.width / size_large
          : MediaQuery.of(context).size.width / size_small,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3.0, color: mainBlue),
        ),
      ),
    );
  }

  Container subTitle(String text) {
    return Container(
      margin: isLargeScreen
          ? EdgeInsets.only(top: 30.0, bottom: 0.0, left: 20)
          : EdgeInsets.only(top: 10.0, bottom: 5.0),
      alignment: isLargeScreen ? Alignment.center : Alignment.center,
      child: Text(text,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: isLargeScreen ? 24 : 12,
            fontWeight: FontWeight.w400,
            color: mainBlue,
          )),
    );
  }

  Center listShow(String listName, String buttonName, String routeName) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 5.0),
            width: isLargeScreen
                ? MediaQuery.of(context).size.width / 1.5
                : MediaQuery.of(context).size.width / 1.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: isLargeScreen ? 38 : 38,
                  width: isLargeScreen
                      ? MediaQuery.of(context).size.width / 2.5
                      : MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0.0, 5)),
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      final result =
                          await Navigator.pushNamed(context, routeName);
                      if (routeName == '/clients_list') {
                        setState(() {
                          _clientList.add(result.toString());
                        });
                      }
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          simpleText(listName, true),
                          Icon(Icons.arrow_drop_down_outlined)
                        ]),
                  ),
                ),
                ButtonTheme(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: mainBlue),
                      onPressed: null,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: simpleText(buttonName, false),
                      )),
                ),
              ],
            )),
      ]),
    );
  }

  Container buttons(String buttonText1, buttonText2) {
    return Container(
        width: isLargeScreen
            ? MediaQuery.of(context).size.width / 1.4
            : MediaQuery.of(context).size.width / 1.2,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            OutlineButton(
                color: Colors.black54,
                textColor: Colors.black54,
                disabledTextColor: Colors.black,
                padding: isLargeScreen
                    ? EdgeInsets.only(
                        top: 20.0, bottom: 20, right: 50, left: 50)
                    : EdgeInsets.only(
                        top: 15.0, bottom: 15, right: 20, left: 20),
                child: Text(buttonText1),
                onPressed: () {
                  Navigator.pushNamed(context, "/commercial");
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(13.0))),
            FlatButton(
              color: mainBlue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: isLargeScreen
                  ? EdgeInsets.only(top: 20.0, bottom: 20, right: 50, left: 50)
                  : EdgeInsets.only(top: 15.0, bottom: 15, right: 20, left: 20),
              child: Text(buttonText2),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(13.0)),
              onPressed: () {
                Navigator.pushNamed(context, "/commercial_2");
              },
            ),
          ],
        ));
  }

  Container title(String text) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 5.0),
      child: Text(text,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: isLargeScreen ? 24 : 15,
            fontWeight: FontWeight.w600,
            color: mainBlue,
          )),
    );
  }

  Text simpleText(String text, bool bold) {
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: isLargeScreen ? 15 : 12,
          color: bold ? mainBlue : Colors.black54,
          fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
        ));
  }

  Text classicText(String text, double size) {
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: size ,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ));
  }
  Container dividerBlock(double value) {
    return Container(
      height: value,
    );
  }
}
