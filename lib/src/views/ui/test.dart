import 'dart:convert';

import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:madera_prototype/src/buisness_logic/services/api_services/strapi_helper.dart';


class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _testState();
}

class _testState extends State<Test> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   callApi();
    return Scaffold();
  }

  Future<void> callApi() async {
    final strapiClient = Strapi.newClient();
    // http.Response response = await http.post(
    //     'http://telougat.space:1337/auth/local',
    //     body: {'identifier': 'Timothé', 'password': 'Azerty123' });
    // print("ok");
    // print(jsonDecode(response.body) );
    print("*************** TOKEN : ********");
    final token = await strapiClient.http.post('http://telougat.space:1337/auth/local',  data: {'identifier': 'Timothé', 'password': 'Azerty123'});

    // final token =  http.post('http://telougat.space:1337/auth/local',  identifier: 'reader@strapi.io',  );

    print(token);

    // strapiClient.initialize(token: token);
    // strapiClient.initialize(token: 'token');
   //  final json = await strapiClient.http.get('http://telougat.space:1337/Users/1');
   // print("------------- TEST : --------------");
   // print(json);


  }
}
