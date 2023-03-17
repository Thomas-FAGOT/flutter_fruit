// To parse this JSON data, do
//
//     final ville = villeFromJson(jsonString);

import 'dart:convert';

List<VilleV2> villeV2FromJson(String str) =>
    List<VilleV2>.from(json.decode(str).map((x) => VilleV2.fromJson(x)));

String villeV2ToJson(List<VilleV2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VilleV2 {
  VilleV2({
    required this.lat,
    required this.lon,
    required this.displayName,
  });

  String lat;
  String lon;
  String displayName;

  factory VilleV2.fromJson(Map<String, dynamic> json) => VilleV2(
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
