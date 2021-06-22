
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class BureauModule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BureauModuleState();
}

class _BureauModuleState extends State<BureauModule> {
  String _title = "Création module";
  final _formKey = GlobalKey<FormState>();
  String _designation, _hauteur, _longueur, _quantite;
  String dropdownValueComposants = "...";
  List listComposant = ["...", "Composant1", "Composant2", "Composant3", "Composant4"];
  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    final form = _formKey.currentState;
    //if (form.validate()) {
      this.insert();
    //}
  }

  void insert() async {
    print(_designation);
    print(dropdownValueComposants);
    print(_hauteur);
    print(_longueur);
    print(_quantite);
  }
  @override
  Widget build(BuildContext context) {
    isLargeScreen = appSetting.getDeviceSize(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: reusableWidgets.header(_title),
        bottomNavigationBar: reusableWidgets.bottomBar(context),
        body: Form(
          child: Center(
            child: Column(
              children: [
                if(isLargeScreen) dividerBlock(50),
                // divider(4, 4),
                title("Module"),
                divider(1.1, 4),
                Container(
                  width: isLargeScreen
                      ? MediaQuery.of(context).size.width / 1
                      : MediaQuery.of(context).size.width / 0.8,
                  child: Column(
                    children: [
                      if(isLargeScreen) dividerBlock(100),
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            textField(
                                "Désignation",
                                "Vous devez renseigner une désignation",
                                "Désignation :"),
                            listShow("Liste des composants", "Nouveau composant", ""),
                            textField(
                                "Hauteur",
                                "Vous devez renseigner une hauteur",
                                "Hauteur :"),
                            textField(
                                "Longueur",
                                "Vous devez renseigner une longueur",
                                "Longueur :"),
                            textField(
                                "Quantité",
                                "Vous devez renseigner une quantité",
                                "Quantité :"),
                            Column(children: [
                              Container(
                                margin: EdgeInsets.only(top: 30.0, bottom: 3.0),
                              )
                            ]),
                            if(isLargeScreen) dividerBlock(50),
                            buttons("Annuler", "Enregistrer"),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Column textField(String hintText, String textEmptyMessage, String libel) {
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
          autofocus: true,
          enableSuggestions: true,
          autocorrect: false,
          decoration: InputDecoration(
            // border: OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFF73A1C2)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15.0),
          ),
          onChanged: (value) {
            if (hintText == "Désignation") {
              this._designation = value;
            } else if (hintText == "Hauteur") {
              this._hauteur = value;
            } else if (hintText == "Longueur") {
              this._longueur = value;
            } else if (hintText == "Quantité") {
              this._quantite = value;
            }
          },
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
      margin: isLargeScreen ? EdgeInsets.only( bottom: 40.0, ) : EdgeInsets.only( bottom: 20.0, ),
      width: isLargeScreen
          ? MediaQuery.of(context).size.width / size_large
          : MediaQuery.of(context).size.width / size_small,
      decoration: const BoxDecoration(
        border: Border( bottom: BorderSide(width: 3.0, color: mainBlue),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 3.0),
                    alignment: Alignment.centerLeft,
                    width: isLargeScreen
                        ? MediaQuery.of(context).size.width / 1.5
                        : MediaQuery.of(context).size.width / 1.3,
                    child: simpleText(listName, false)),
                Row(
                  children: [
                    Container(
                      height: isLargeScreen ? 60 : 30,
                      margin: new EdgeInsets.symmetric(vertical: 0.0),
                      width: isLargeScreen
                          ? MediaQuery.of(context).size.width / 1.5
                          : MediaQuery.of(context).size.width / 2.5,
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
                      child: DropdownButton(
                        hint: Text('Sélectionnez un composant'),
                        value: dropdownValueComposants,
                        onChanged: (newValueStatus){
                          setState(() {
                            dropdownValueComposants = newValueStatus;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        items: listComposant.map((valueItemClient) {
                          return DropdownMenuItem(
                            value: valueItemClient,
                            child: Text(valueItemClient),
                          );
                        }).toList(),
                      ),
                    ),
                    ButtonTheme(
                      child :ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: mainBlue),
                          onPressed: null,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: simpleText(buttonName, false),
                          )),
                    ),
                  ],
                )
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
                padding: isLargeScreen ? EdgeInsets.only(top: 20.0 , bottom: 20, right: 50, left: 50) : EdgeInsets.only(top: 15.0 , bottom: 15, right: 20, left: 20),
                child: Text(buttonText1),
                onPressed: () {
                  Navigator.pushNamed(context, "/commercial");
                },
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(13.0))
            ),
            FlatButton(
              color: mainBlue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: isLargeScreen ? EdgeInsets.only(top: 20.0 , bottom: 20, right: 50, left: 50) : EdgeInsets.only(top: 15.0 , bottom: 15, right: 20, left: 20),
              child: Text(buttonText2),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(13.0)),
              onPressed: _submit,
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

  Container dividerBlock(double value){
    return Container(
      height: value,
    );
  }

}
