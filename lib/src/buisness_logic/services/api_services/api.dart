import 'package:dart_strapi/dart_strapi.dart';
import 'package:http/http.dart' as http;
import 'package:madera_prototype/src/buisness_logic/models/client.dart';



class Api  {

  static Strapi _strapiClient;

  static Future<bool> connect(String user, String password) async {
    Api._strapiClient = Strapi.newClient();
    try {
      final authData = await _strapiClient.http.post('https://madera.telougat.space/auth/local',  data: {'identifier': user, 'password': password});
      Api._strapiClient.initialize(base_url: 'https://madera.telougat.space', token: authData.data["jwt"].toString());
      return true;
    } catch (DioError) {
      return false;
    }
  }

  static Future<List<ContentType>> getProjects() async {
    List<ContentType> projects = await Api._strapiClient.find("projects");
    return projects;
  }

  static Future<List<ContentType>> getRanges() async {
    List<ContentType> ranges = await Api._strapiClient.find("ranges");
    return ranges;
  }

  static Future<ContentType> getProject(String id) async {
    ContentType project = await Api._strapiClient.findOne("projects", id);
    return project;
  }

  static Future<List<ContentType>> getQuotes() async {
    List<ContentType> quotes = await Api._strapiClient.find("quotes");
    return quotes;
  }

  static Future<ContentType> getQuote(String id) async {
    ContentType quote = await Api._strapiClient.findOne("quotes", id);
    return quote;
  }

  // Client

  static Future<List<ContentType>> getClients() async {
    List<ContentType> clients = await Api._strapiClient.find("clients");
    return clients;
  }

  static Future<ContentType> createClient(ContentType client) async {
    return await Api._strapiClient.create(client);
  }

  static Future<ContentType> updateClient(ContentType client) async {
    return await Api._strapiClient.update(client);
  }

  static Future<ContentType> getClient(String id) async {
    ContentType client = await Api._strapiClient.findOne("clients", id);
    return client;
  }

  static Future<ContentType> deleteClient(String id) async {
    return await Api._strapiClient.deleteById("clients", id);
  }

  // Status
  static Future<ContentType> getStatus(String id) async {
    return await Api._strapiClient.findOne("statuses", id);
  }

  static Future<List<ContentType>> getStatuses() async {
    return await Api._strapiClient.find("statuses");
  }

  static Future<ContentType> createStatus(Map<String, dynamic> wrapped) async {
    ContentType newStatus = new ContentType("statuses", wrapped);
    return await Api._strapiClient.create(newStatus);
  }

  static Future<ContentType> deleteStatus(String id) async {
    return await Api._strapiClient.deleteById("statuses", id);
  }

  static Future<ContentType> updateStatus(Map<String, dynamic> wrapped) async {
    ContentType updatedStatus = new ContentType("statuses", wrapped);
    return await Api._strapiClient.update(updatedStatus);
  }
}