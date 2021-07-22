import 'dart:convert';

import 'package:flutter_fyp_app/models/location.dart';
import 'package:http/http.dart' as http;

class LocationRepository {
  Future<List<Location>> fetchLocations() async {
    List<Location> locations = [];
    final response =
        await http.get(Uri.parse('https:/localhost:3000/location'));

    if (response.statusCode == 200) {
      var jsons = jsonDecode(response.body);
      for (var json in jsons) {
        locations.add(Location.fromJson(json));
      }
      return locations;
    } else {
      throw Exception('Failed to load location');
    }
  }
}
