import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nasa2/models/apod_response.dart'; // Asegúrate de que la ruta sea correcta

class NasaProvider extends ChangeNotifier {
  String _baseUrl = 'api.nasa.gov';
  String _apiKey = 'npq2aac3Y7hQ0nBBJOY5QhDhYLUcmTZOfmx0Zai8';
  late String _date;
  Apod? apod;

  NasaProvider() {
    // Obtener la fecha actual y formatearla como se espera en la API
    _date =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
    getApod();
  }

  getApod() async {
    var url = Uri.https(_baseUrl, 'planetary/apod', {
      'api_key': _apiKey,
      'date': _date,
    });

    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);

    apod = Apod.fromJson(decodedData);
    notifyListeners();
  }
}
