import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';

class Client {

  String id;
  String firstname;
  String lastname;
  String mail;
  String address;
  String phone;

  DateTime created_at;
  DateTime updated_at;

  Client();

  Future<bool> init(String id) async {
    ContentType client = await Api.getClient(id);
    if (client != null) {
      this._initFromContentType(client);
    }
    return client != null;
  }

  void _initFromContentType(ContentType client) {
    this.id = client.data['id'].toString();
    this.firstname = client.data['Firstname'];
    this.lastname = client.data['Lastname'];
    this.mail = client.data['Mail'];
    this.address = client.data['Address'];
    this.phone = client.data['Phone'];

    this.created_at = DateTime.parse(client.data['created_at']);
    this.updated_at = DateTime.parse(client.data['updated_at']);
  }

  ContentType _convertToContentType() {
    Map<String, dynamic> clientDatas = {
      "id": id,
      "Firstname": firstname,
      "Lastname": lastname,
      "Mail": mail,
      "Address": address,
      "Phone": phone
    };
    return new ContentType("clients", clientDatas);
  }

  Future<bool> update() async {
    ContentType updatedClient = await Api.updateClient(_convertToContentType());
    if(updatedClient != null) {
      this._initFromContentType(updatedClient);
    }
    return updatedClient != null;
  }

  static Future<Client> create(String firstname, String lastname, String mail, String address, String phone) async {
    Map<String, dynamic> datas = {
      "Firstname": firstname,
      "Lastname": lastname,
      "Mail": mail,
      "Address": address,
      "Phone": phone
    };
    ContentType client = await Api.createClient(new ContentType("clients", datas));
    if(client != null) {
      Client newClient = new Client();
      newClient._initFromContentType(client);
      return newClient;
    }
    return null;
  }

  static Future<List<Client>> getClients() async {
    List<ContentType> fetchedClients = await Api.getClients();
    List<Client> clients = new List<Client>();
    for(final client in fetchedClients) {
      Client newClient = new Client();
      newClient._initFromContentType(client);
      clients.add(newClient);
    }
    return clients;
  }

  static Future<bool> delete(String id) async {
    ContentType deletedClient = await Api.deleteClient(id);
    return deletedClient != null;
  }

  @override
  String toString() {
    return "Firstname : " + this.firstname + " Lastname : " + this.lastname + " Mail : " + this.mail + " Phone : " + this.phone + " Address : " + this.address + " Created : " + this.created_at.toString();
  }

}