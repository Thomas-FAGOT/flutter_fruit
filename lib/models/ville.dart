// To parse this JSON data, do
//
//     final ville = villeFromJson(jsonString);

import 'dart:convert';

List<Ville> villeFromJson(String str) =>
    List<Ville>.from(json.decode(str).map((x) => Ville.fromJson(x)));

String villeToJson(List<Ville> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ville {
  Ville({
    required this.lat,
    required this.lon,
    required this.displayName,
  });

  String lat;
  String lon;
  String displayName;

  factory Ville.fromJson(Map<String, dynamic> json) => Ville(
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
      };
}
