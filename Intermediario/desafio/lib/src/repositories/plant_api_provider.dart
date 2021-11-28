import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert' as convert;
import 'package:challenge_ui_plant_app/src/models/plant.dart';

class PlantApiProvider {
  Client client = Client();
  Future<List<Plant>> fetchPlantList() async {
    String uri = 'https://study-web-app.herokuapp.com/plants';
    try {
      final response = await client.read(Uri.parse(uri));
      List<dynamic> body = convert.jsonDecode(response);
      return body.map((dynamic item) => Plant.fromJson(item)).toList();
    } finally {
      client.close();
    }
  }
}
