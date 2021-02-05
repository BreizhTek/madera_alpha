import 'package:dart_strapi/dart_strapi.dart';
import 'package:http/http.dart' as http;



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

  static Future<List<ContentType>> getClients() async {
    List<ContentType> clients = await Api._strapiClient.find("clients");
    return clients;
  }

  static Future<ContentType> createClient(String firstname, String lastname, String addresse, int phone) async {
    Map<String, dynamic> clientInfos = {
      "Firstname": firstname,
      "Lastname": lastname,
      "Addresse": addresse,
      "Phone": phone
    };
    ContentType client = new ContentType("clients", clientInfos);
    print(await Api._strapiClient.create(client));
  }

  static Future<ContentType> getClient(String id) async {
    ContentType client = await Api._strapiClient.findOne("clients", id);
    return client;
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
}