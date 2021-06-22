
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class CommercialCustomer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommercialCustomerState();
}

class CommercialCustomerState extends State<CommercialCustomer> {
  String _title = "Création client";
  final _formKey = GlobalKey<FormState>();
  String _last_name, _first_name, _email, _phone, _adress, _postalcode, _city;

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      this.insert();
    }
  }

  void insert() async {
    print(_last_name);
    print(_first_name);
    print(_email);
    print(_phone);
    print(_adress);
    print(_postalcode);
    print(_city);
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
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: isLargeScreen
                      ? MediaQuery.of(context).size.width / 1
                      : MediaQuery.of(context).size.width / 0.8,
                  child: Column(
                    children: [
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            textField(
                                "Nom",
                                "Vous devez renseigner un nom",
                                "Nom :"),
                            textField(
                                "Prénom",
                                "Vous devez renseigner un prénom",
                                "Prénom :"),
                            textField(
                                "Email",
                                "Vous devez renseigner un email",
                                "Email :"),
                            textField(
                                "Téléphone",
                                "Vous devez renseigner un téléphone",
                                "Téléphone :"),
                            textField(
                                "Adresse",
                                "Vous devez renseigner une adresse",
                                "Adresse :"),
                            textField(
                              "Code postale",
                                "Vous devez renseigner un code postale",
                                "Code postale :"),
                            textField(
                                "Ville",
                                "Vous devez renseigner une ville",
                                "Ville :"),
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
            if (hintText == "Nom") {
              this._last_name = value;
            } else if (hintText == "Prénom") {
              this._first_name = value;
            } else if (hintText == "Email") {
              this._email = value;
            } else if (hintText == "Téléphone") {
              this._phone = value;
            } else if (hintText == "Adresse") {
              this._adress = value;
            } else if (hintText == "Code postal") {
              this._postalcode = value;
            } else if (hintText == "Ville") {
              this._city = value;
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
