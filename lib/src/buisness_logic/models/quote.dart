import 'package:dart_strapi/dart_strapi.dart';
import 'package:madera_prototype/src/buisness_logic/models/status.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';
import 'client.dart';


class Quote {

  String id;
  String ammount;
  String tax;

  List<Client> clients;
  Status status;

  DateTime created_at;
  DateTime updated_at;

  Quote() {
    this.clients = new List<Client>();
  }

  Future<bool> init(String id) async {
    ContentType quote = await Api.getQuote(id);
    print(quote.toString());
    if (quote != null) {
      this._initFromContentType(quote);
    }
    return quote != null;
  }

  void _initFromContentType(ContentType quote) {
    this.id = quote.data["id"].toString();
    this.ammount = quote.data["ammount"].toString();
    this.tax = quote.data["tax"].toString();

    for (var i=0;i<quote.data["clients"].length;i++) {
      Client newClient = new Client();
      newClient.init(quote.data["clients"][i]["id"].toString());
      this.clients.add(newClient);
    }

    Status newStatus = new Status();
    newStatus.init(quote.data["status"]["id"].toString());
    this.status = newStatus;

    this.created_at = DateTime.parse(quote.data['created_at']);
    this.updated_at = DateTime.parse(quote.data['updated_at']);
  }

  void printData() {
    print("Ammount " + this.ammount.toString() + " - " + "tax " + this.tax.toString());
  }

}