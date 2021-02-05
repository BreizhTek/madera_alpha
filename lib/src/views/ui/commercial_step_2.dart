
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/views/components/reusable_widgets.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';

class CommercialStep2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommercialStep2State();
}

class _CommercialStep2State extends State<CommercialStep2> {
  String _title = "Création de devis";
  String _project;

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
            child: Column(
              children: [
                if(isLargeScreen) dividerBlock(50),
                // divider(4, 4),
                title("Conception des porduits"),
                divider(1.1, 4),
                Container(
                  width: isLargeScreen
                      ? MediaQuery.of(context).size.width / 1
                      : MediaQuery.of(context).size.width / 0.8,
                  child: Column(
                    children: [
                      if(isLargeScreen) dividerBlock(50),
                      subTitle("Etape 2 - Conception des produits"),
                      if(isLargeScreen) dividerBlock(100),
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            listShow("Liste de gammes", "/commercial/ranges"),
                            listShow("Liste modèle d'une gamme", ""),
                            listShow("Type de remplissage", ""),
                            listShow("Finition", ""),
                            listShow("Sélection coupe", ""),
                            if(isLargeScreen) dividerBlock(50),
                            buttons("Annuler", "Continuer"),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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

  Center listShow(String listName, String routeName) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 5.0),
            width: isLargeScreen
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width / 1.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
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
                      onPressed: () {
                        if(routeName.isNotEmpty) {
                          Navigator.pushNamed(context, routeName);
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
                ),
              ],
            )),
      ]),
    );
  }

  Container buttons(String buttonText1, buttonText2) {
    return Container(
        width: isLargeScreen
            ? MediaQuery.of(context).size.width * 0.8
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
                  Navigator.pushNamed(context, "/commercial_1");
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
              onPressed: () {},
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
