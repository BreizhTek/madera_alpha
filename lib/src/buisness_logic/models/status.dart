

import 'package:dart_strapi/dart_strapi.dart';
import 'package:madera_prototype/src/buisness_logic/services/api_services/api.dart';

class Status {

  String id;
  String designation;

  DateTime created_at;
  DateTime updated_at;

  Status();

  ContentType _convertToContentType() {
    Map<String, dynamic> statusDatas = {
      "id": id,
      "Designation": designation
    };
    return new ContentType("clients", statusDatas);
  }

  void _initFromContentType(ContentType status) {
    this.id = status.data['id'].toString();
    this.designation = status.data['Designation'];
    this.created_at = DateTime.parse(status.data['created_at']);
    this.updated_at = DateTime.parse(status.data['updated_at']);
  }

  Future<bool> init(String id) async {
    ContentType status = await Api.getStatus(id);
    if (status != null) {
      this._initFromContentType(status);
    }
    return status != null;
  }


}