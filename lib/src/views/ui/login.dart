import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _title = "Madera";
  String _email, _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appSetting(context);
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: reusableWidgets.header(''),
        body: Form(
              key: _formKey,
              child: Container(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: ThemeText.title(_title),
                        ),
                        subTitle("Connexion"),
                        textField(
                            "Email",
                            "Vous devez renseigner une adresse Email",
                            false),
                        textField(
                            "Mot de passe",
                            "Vous devez renseigner un mot de passe",
                            true),
                        button("CONNEXION"),
                        ThemeText.simpleText("Problème de connexion ?")
                      ]) ,
                ),
              )),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      this.login();
    }
  }

  void login() async {
    bool success = await Api.connect(_email, _password);
    if (success) {
      Navigator.pushNamed(context, "/commercial");
    } else {
      this._showToast(context);
    }
  }

  void _showToast(BuildContext context) {
    final snackBar = SnackBar(content: Text('Email ou mot de passe faux !'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


  Container subTitle(String text) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 15.0),
      padding: new EdgeInsets.only(top: 16.0),
      alignment: Alignment.topLeft,
      width: isLargeScreen
          ? MediaQuery
          .of(context)
          .size
          .width / 2
          : MediaQuery
          .of(context)
          .size
          .width / 3,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3.0, color: mainBlue),
        ),
      ),
      child: ThemeText.subTitle(text),
    );
  }

  Container textField(String hintText, String textEmptyMessage,
      bool obscureText) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 15.0),
      width: isLargeScreen
          ? MediaQuery
          .of(context)
          .size
          .width / 2.0
          : MediaQuery
          .of(context)
          .size
          .width / 1.3,
      child: TextFormField(
        obscureText: obscureText,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          // border: OutlineInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF73A1C2)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.0),
        ),
        onChanged: (value) {
          if (hintText == "Email") {
            this._email = value;
          } else {
            this._password = value;
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
}
