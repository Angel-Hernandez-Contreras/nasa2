import 'package:meta/meta.dart'; // Importa el paquete meta para utilizar anotaciones como @required
import 'dart:convert'; // Importa el paquete dart:convert para trabajar con JSON

class Apod {
  String copyright; // Campo que almacena el derecho de autor
  DateTime date; // Campo que almacena la fecha
  String explanation; // Campo que almacena la explicación
  String hdurl; // Campo que almacena la URL de alta definición de la imagen
  String mediaType; // Campo que almacena el tipo de medio (puede ser "image")
  String serviceVersion; // Campo que almacena la versión del servicio
  String title; // Campo que almacena el título
  String url; // Campo que almacena la URL de la imagen

  Apod({
    // Constructor de la clase Apod
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  factory Apod.fromRawJson(String str) => Apod.fromJson(json.decode(
      str)); // Fábrica para crear una instancia de Apod a partir de un JSON codificado

  String toRawJson() =>
      json.encode(toJson()); // Método para codificar el objeto Apod como JSON

  factory Apod.fromJson(Map<String, dynamic> json) => Apod(
        // Fábrica para crear una instancia de Apod a partir de un mapa JSON
        copyright: json["copyright"],
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        // Método para convertir el objeto Apod a un mapa JSON
        "copyright": copyright,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
      };
}
