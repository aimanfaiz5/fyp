import 'dart:convert';
import 'package:flutter_fyp_app/models/location.dart';
import 'package:http/http.dart' as http;

class LocationRepository {
  http.Client _client;

  LocationRepository() {
    this._client = new http.Client();
  }

  Future<List<Location>> fetchLocations() async {
    try {
      List<Location> locations = [];
      final response = await this
          ._client
          .get(Uri.parse('http://192.168.8.104:3000/locations/'));

      if (response.statusCode == 200) {
        dynamic jsons = jsonDecode(response.body);
        for (int i = 0; i < jsons.length; i++) {
          locations.add(Location.fromJSON(jsons[i]));
        }
        return locations;
      } else {
        throw Exception('Failed to load locations');
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
