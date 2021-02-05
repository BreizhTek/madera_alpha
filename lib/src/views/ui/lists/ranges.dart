import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'package:madera_prototype/src/buisness_logic/utils/configuration.dart';
import 'package:madera_prototype/src/views/utils/style.dart';
import 'package:dart_strapi/dart_strapi.dart';

class Ranges extends StatelessWidget {
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

  List<ContentType> _rangesList;

  Future<bool> getRangesList () async {
    this._rangesList = await Api.getRanges();
    return true;
  }

  List<Container> listRanges () {
    List<Container> containers = [];
    for(var i=0;i<this._rangesList.length;i++) {
      containers.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 25),
            child: Text(this._rangesList[i].data['Label']),
          )
      );
    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1, // 20%
              child: Container(),
            ),
            Expanded(
              flex: 8, // 60%
              child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container (
                              margin: EdgeInsets.only(top: 40),
                              child: ThemeText.title("Gammes"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              width: MediaQuery.of(context).size.width * 0.8,
                              margin: EdgeInsets.only(top: 30),
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: FutureBuilder<bool>(
                                future: getRangesList(),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData) {
                                    return ListView(
                                      children: listRanges(),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              )
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ),
            ),
            Expanded(
              flex: 1, // 20%
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}