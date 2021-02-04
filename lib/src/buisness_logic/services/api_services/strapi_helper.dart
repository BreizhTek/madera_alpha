import 'dart:convert';

import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api  {

  Strapi _strapiClient;

  Api(String user, String password){
    Initialize(user, password);
  }

 Strapi getApi(){
    return _strapiClient;
  }

  static Future Initialize(String user, String password) async {

    final _strapiClient = Strapi.newClient();
    final token = await _strapiClient.http.post('http://telougat.space:1337/auth/local',  data: {'identifier': user, 'password': password});
    print(token);

  }
}