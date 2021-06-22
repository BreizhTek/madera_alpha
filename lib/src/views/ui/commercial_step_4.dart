import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class CommercialStep4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommercialStep4State();
}

class _CommercialStep4State extends State<CommercialStep4> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // LoginResponse _response;
  String _email, _password;
  bool isLargeScreen = false;

  String txtCode = "K954423AAA";
  String txtRef = "Référence projet";
  String txtDate = "04/02/2021";
  String txtLastName = "DUPONT";
  String txtFirstName = "Fabrice";
  String txtPhone = "0123456789";
  String txtEmail= "fabrice.dupont@orange.fr";
  String txtAdresse = "10 rue l'avarice, 72000 Le mans";
  String dropdownValueStatus = "En cours";
  List listStatus = ["Annulée", "En cours", "Gagnée", "Perdu"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _title = "Devis";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: reusableWidgets.header(_title),
      bottomNavigationBar: reusableWidgets.bottomBar(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Synthèse", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.blueAccent,
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Etape 4 - Synthèse", textAlign: TextAlign.left),
                    ),
                    Expanded (
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3.3,
                        margin: new EdgeInsets.symmetric(vertical: 15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: mainBlue),
                          onPressed: _submit,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text('Export PDF'),
                          ),
                        ),
                      )
                    ),
                  ]
              ),
              Row(
                children: <Widget> [
                  Expanded (
                      child: Text(txtCode, textAlign: TextAlign.center),
                  ),
                  Expanded (
                    child: Text(txtRef, textAlign: TextAlign.center),
                  ),
                  Expanded (
                    child: DropdownButton(
                      hint: Text('Sélectionnez un statut'),
                      value: dropdownValueStatus,
                      onChanged: (newValueStatus){
                        setState(() {
                          dropdownValueStatus = newValueStatus;
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
                      items: listStatus.map((valueItemClient) {
                        return DropdownMenuItem(
                          value: valueItemClient,
                          child: Text(valueItemClient),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text(txtDate, textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text(txtLastName, textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text(txtFirstName, textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text(txtPhone, textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text(txtEmail, textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text(txtAdresse, textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.blueAccent,
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Produits", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Unité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Quantité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Coûts", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: MediaQuery.of(context).size.height/8,
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            )]
                      ),
                    )
                  ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.blueAccent,
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Montant du devis HT :", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("TVA : ", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Produits", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Unité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Quantité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Coûts", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: MediaQuery.of(context).size.height/4,
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            )]
                      ),
                    )
                  ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.blueAccent,
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Module 1 :", textAlign: TextAlign.left),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Produits", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Unité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Quantité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Coûts", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: MediaQuery.of(context).size.height/8,
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            )]
                      ),
                    )
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Module 2 :", textAlign: TextAlign.left),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Produits", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Unité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Quantité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Coûts", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: MediaQuery.of(context).size.height/8,
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            )]
                      ),
                    )
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Module 3 :", textAlign: TextAlign.left),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Produits", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Unité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Quantité", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Coûts", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: MediaQuery.of(context).size.height/8,
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            )]
                      ),
                    )
                  ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.blueAccent,
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget> [
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: MediaQuery.of(context).size.height/8,
                          margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                )]
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: MediaQuery.of(context).size.height/8,
                          margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                )]
                          ),
                        )
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Cuisine", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Salon", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: MediaQuery.of(context).size.height/8,
                          margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                )]
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: MediaQuery.of(context).size.height/8,
                          margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                )]
                          ),
                        )
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Chambre 1", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("Chambre 2", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: MediaQuery.of(context).size.height/8,
                          margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                )]
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: MediaQuery.of(context).size.height/8,
                          margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                )]
                          ),
                        )
                    ),
                  ]
              ),
              Row(
                  children: <Widget> [
                    Expanded (
                      child: Text("Salle de bain", textAlign: TextAlign.center),
                    ),
                    Expanded (
                      child: Text("WC", textAlign: TextAlign.center),
                    ),
                  ]
              ),
              Row(
                children: [
                  button("Annulée"),
                  button("Clôturer"),
                  button("Enregistrer"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container button(String text) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 3.3,
      margin: new EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: mainBlue),
        onPressed: _submit,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(text),
        ),
      ),
    );
  }


  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
     // Api(_email, _password).getApi();
    }
  }

}
