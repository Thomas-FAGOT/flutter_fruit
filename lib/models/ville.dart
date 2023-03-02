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
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.boundingbox,
    required this.lat,
    required this.lon,
    required this.displayName,
    required this.villeClass,
    required this.type,
    required this.importance,
    this.icon,
  });

  int placeId;
  String licence;
  String osmType;
  int osmId;
  List<String> boundingbox;
  String lat;
  String lon;
  String displayName;
  String villeClass;
  String type;
  double importance;
  String? icon;

  factory Ville.fromJson(Map<String, dynamic> json) => Ville(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        villeClass: json["class"],
        type: json["type"],
        importance: json["importance"]?.toDouble(),
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
        "osm_id": osmId,
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
        "class": villeClass,
        "type": type,
        "importance": importance,
        "icon": icon,
      };
}
