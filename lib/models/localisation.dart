// To parse this JSON data, do
//
//     final localisation = localisationFromJson(jsonString);

import 'dart:convert';

Localisation localisationFromJson(String str) =>
    Localisation.fromJson(json.decode(str));

String localisationToJson(Localisation data) => json.encode(data.toJson());

class Localisation {
  Localisation({
    this.documentation,
    this.licenses,
    this.rate,
    required this.results,
    this.status,
    this.stayInformed,
    this.thanks,
    this.timestamp,
    this.totalResults,
  });

  String? documentation;
  List<License>? licenses;
  Rate? rate;
  List<Result> results;
  Status? status;
  StayInformed? stayInformed;
  String? thanks;
  Timestamp? timestamp;
  int? totalResults;

  factory Localisation.fromJson(Map<String, dynamic> json) => Localisation(
        documentation: json["documentation"],
        licenses: List<License>.from(
            json["licenses"].map((x) => License.fromJson(x))),
        rate: Rate.fromJson(json["rate"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: Status.fromJson(json["status"]),
        stayInformed: StayInformed.fromJson(json["stay_informed"]),
        thanks: json["thanks"],
        timestamp: Timestamp.fromJson(json["timestamp"]),
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "documentation": documentation,
        "licenses": List<dynamic>.from(licenses!.map((x) => x.toJson())),
        "rate": rate?.toJson(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status?.toJson(),
        "stay_informed": stayInformed?.toJson(),
        "thanks": thanks,
        "timestamp": timestamp?.toJson(),
        "total_results": totalResults,
      };
}

class License {
  License({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Rate {
  Rate({
    this.limit,
    this.remaining,
    this.reset,
  });

  int? limit;
  int? remaining;
  int? reset;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        limit: json["limit"],
        remaining: json["remaining"],
        reset: json["reset"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "remaining": remaining,
        "reset": reset,
      };
}

class Result {
  Result({
    this.annotations,
    this.bounds,
    required this.components,
    this.confidence,
    required this.formatted,
    this.geometry,
  });

  Annotations? annotations;
  Bounds? bounds;
  Components components;
  int? confidence;
  String formatted;
  Geometry? geometry;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        annotations: Annotations.fromJson(json["annotations"]),
        bounds: Bounds.fromJson(json["bounds"]),
        components: Components.fromJson(json["components"]),
        confidence: json["confidence"],
        formatted: json["formatted"],
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "annotations": annotations?.toJson(),
        "bounds": bounds?.toJson(),
        "components": components?.toJson(),
        "confidence": confidence,
        "formatted": formatted,
        "geometry": geometry?.toJson(),
      };
}

class Annotations {
  Annotations({
    this.dms,
    this.mgrs,
    this.maidenhead,
    this.mercator,
    this.nuts,
    this.osm,
    this.unM49,
    this.callingcode,
    this.currency,
    this.flag,
    this.geohash,
    this.qibla,
    this.roadinfo,
    this.sun,
    this.timezone,
    this.what3Words,
  });

  Dms? dms;
  String? mgrs;
  String? maidenhead;
  Mercator? mercator;
  Nuts? nuts;
  Osm? osm;
  UnM49? unM49;
  int? callingcode;
  Currency? currency;
  String? flag;
  String? geohash;
  double? qibla;
  Roadinfo? roadinfo;
  Sun? sun;
  Timezone? timezone;
  What3Words? what3Words;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        dms: Dms.fromJson(json["DMS"]),
        mgrs: json["MGRS"],
        maidenhead: json["Maidenhead"],
        mercator: Mercator.fromJson(json["Mercator"]),
        nuts: Nuts.fromJson(json["NUTS"]),
        osm: Osm.fromJson(json["OSM"]),
        unM49: UnM49.fromJson(json["UN_M49"]),
        callingcode: json["callingcode"],
        currency: Currency.fromJson(json["currency"]),
        flag: json["flag"],
        geohash: json["geohash"],
        qibla: json["qibla"].toDouble(),
        roadinfo: Roadinfo.fromJson(json["roadinfo"]),
        sun: Sun.fromJson(json["sun"]),
        timezone: Timezone.fromJson(json["timezone"]),
        what3Words: What3Words.fromJson(json["what3words"]),
      );

  Map<String, dynamic> toJson() => {
        "DMS": dms?.toJson(),
        "MGRS": mgrs,
        "Maidenhead": maidenhead,
        "Mercator": mercator?.toJson(),
        "NUTS": nuts?.toJson(),
        "OSM": osm?.toJson(),
        "UN_M49": unM49?.toJson(),
        "callingcode": callingcode,
        "currency": currency?.toJson(),
        "flag": flag,
        "geohash": geohash,
        "qibla": qibla,
        "roadinfo": roadinfo?.toJson(),
        "sun": sun?.toJson(),
        "timezone": timezone?.toJson(),
        "what3words": what3Words?.toJson(),
      };
}

class Currency {
  Currency({
    this.alternateSymbols,
    this.decimalMark,
    this.htmlEntity,
    this.isoCode,
    this.isoNumeric,
    this.name,
    this.smallestDenomination,
    this.subunit,
    this.subunitToUnit,
    this.symbol,
    this.symbolFirst,
    this.thousandsSeparator,
  });

  List<dynamic>? alternateSymbols;
  String? decimalMark;
  String? htmlEntity;
  String? isoCode;
  String? isoNumeric;
  String? name;
  int? smallestDenomination;
  String? subunit;
  int? subunitToUnit;
  String? symbol;
  int? symbolFirst;
  String? thousandsSeparator;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        alternateSymbols:
            List<dynamic>.from(json["alternate_symbols"].map((x) => x)),
        decimalMark: json["decimal_mark"],
        htmlEntity: json["html_entity"],
        isoCode: json["iso_code"],
        isoNumeric: json["iso_numeric"],
        name: json["name"],
        smallestDenomination: json["smallest_denomination"],
        subunit: json["subunit"],
        subunitToUnit: json["subunit_to_unit"],
        symbol: json["symbol"],
        symbolFirst: json["symbol_first"],
        thousandsSeparator: json["thousands_separator"],
      );

  Map<String, dynamic> toJson() => {
        "alternate_symbols":
            List<dynamic>.from(alternateSymbols!.map((x) => x)),
        "decimal_mark": decimalMark,
        "html_entity": htmlEntity,
        "iso_code": isoCode,
        "iso_numeric": isoNumeric,
        "name": name,
        "smallest_denomination": smallestDenomination,
        "subunit": subunit,
        "subunit_to_unit": subunitToUnit,
        "symbol": symbol,
        "symbol_first": symbolFirst,
        "thousands_separator": thousandsSeparator,
      };
}

class Dms {
  Dms({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Dms.fromJson(Map<String, dynamic> json) => Dms(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Mercator {
  Mercator({
    this.x,
    this.y,
  });

  double? x;
  double? y;

  factory Mercator.fromJson(Map<String, dynamic> json) => Mercator(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class Nuts {
  Nuts({
    this.nuts0,
    this.nuts1,
    this.nuts2,
    this.nuts3,
  });

  Nuts0Class? nuts0;
  Nuts0Class? nuts1;
  Nuts0Class? nuts2;
  Nuts0Class? nuts3;

  factory Nuts.fromJson(Map<String, dynamic> json) => Nuts(
        nuts0: Nuts0Class.fromJson(json["NUTS0"]),
        nuts1: Nuts0Class.fromJson(json["NUTS1"]),
        nuts2: Nuts0Class.fromJson(json["NUTS2"]),
        nuts3: Nuts0Class.fromJson(json["NUTS3"]),
      );

  Map<String, dynamic> toJson() => {
        "NUTS0": nuts0?.toJson(),
        "NUTS1": nuts1?.toJson(),
        "NUTS2": nuts2?.toJson(),
        "NUTS3": nuts3?.toJson(),
      };
}

class Nuts0Class {
  Nuts0Class({
    this.code,
  });

  String? code;

  factory Nuts0Class.fromJson(Map<String, dynamic> json) => Nuts0Class(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class Osm {
  Osm({
    this.editUrl,
    this.noteUrl,
    this.url,
  });

  String? editUrl;
  String? noteUrl;
  String? url;

  factory Osm.fromJson(Map<String, dynamic> json) => Osm(
        editUrl: json["edit_url"],
        noteUrl: json["note_url"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "edit_url": editUrl,
        "note_url": noteUrl,
        "url": url,
      };
}

class Roadinfo {
  Roadinfo({
    this.driveOn,
    this.road,
    this.speedIn,
  });

  String? driveOn;
  String? road;
  String? speedIn;

  factory Roadinfo.fromJson(Map<String, dynamic> json) => Roadinfo(
        driveOn: json["drive_on"],
        road: json["road"],
        speedIn: json["speed_in"],
      );

  Map<String, dynamic> toJson() => {
        "drive_on": driveOn,
        "road": road,
        "speed_in": speedIn,
      };
}

class Sun {
  Sun({
    this.rise,
    this.sunSet,
  });

  Rise? rise;
  Rise? sunSet;

  factory Sun.fromJson(Map<String, dynamic> json) => Sun(
        rise: Rise.fromJson(json["rise"]),
        sunSet: Rise.fromJson(json["set"]),
      );

  Map<String, dynamic> toJson() => {
        "rise": rise?.toJson(),
        "set": sunSet?.toJson(),
      };
}

class Rise {
  Rise({
    this.apparent,
    this.astronomical,
    this.civil,
    this.nautical,
  });

  int? apparent;
  int? astronomical;
  int? civil;
  int? nautical;

  factory Rise.fromJson(Map<String, dynamic> json) => Rise(
        apparent: json["apparent"],
        astronomical: json["astronomical"],
        civil: json["civil"],
        nautical: json["nautical"],
      );

  Map<String, dynamic> toJson() => {
        "apparent": apparent,
        "astronomical": astronomical,
        "civil": civil,
        "nautical": nautical,
      };
}

class Timezone {
  Timezone({
    this.name,
    this.nowInDst,
    this.offsetSec,
    this.offsetString,
    this.shortName,
  });

  String? name;
  int? nowInDst;
  int? offsetSec;
  String? offsetString;
  String? shortName;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json["name"],
        nowInDst: json["now_in_dst"],
        offsetSec: json["offset_sec"],
        offsetString: json["offset_string"],
        shortName: json["short_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "now_in_dst": nowInDst,
        "offset_sec": offsetSec,
        "offset_string": offsetString,
        "short_name": shortName,
      };
}

class UnM49 {
  UnM49({
    this.regions,
    this.statisticalGroupings,
  });

  Regions? regions;
  List<String>? statisticalGroupings;

  factory UnM49.fromJson(Map<String, dynamic> json) => UnM49(
        regions: Regions.fromJson(json["regions"]),
        statisticalGroupings:
            List<String>.from(json["statistical_groupings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "regions": regions?.toJson(),
        "statistical_groupings":
            List<dynamic>.from(statisticalGroupings!.map((x) => x)),
      };
}

class Regions {
  Regions({
    this.europe,
    this.fr,
    this.westernEurope,
    this.world,
  });

  String? europe;
  String? fr;
  String? westernEurope;
  String? world;

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        europe: json["EUROPE"],
        fr: json["FR"],
        westernEurope: json["WESTERN_EUROPE"],
        world: json["WORLD"],
      );

  Map<String, dynamic> toJson() => {
        "EUROPE": europe,
        "FR": fr,
        "WESTERN_EUROPE": westernEurope,
        "WORLD": world,
      };
}

class What3Words {
  What3Words({
    this.words,
  });

  String? words;

  factory What3Words.fromJson(Map<String, dynamic> json) => What3Words(
        words: json["words"],
      );

  Map<String, dynamic> toJson() => {
        "words": words,
      };
}

class Bounds {
  Bounds({
    this.northeast,
    this.southwest,
  });

  Geometry? northeast;
  Geometry? southwest;

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        northeast: Geometry.fromJson(json["northeast"]),
        southwest: Geometry.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast?.toJson(),
        "southwest": southwest?.toJson(),
      };
}

class Geometry {
  Geometry({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Components {
  Components({
    this.iso31661Alpha2,
    this.iso31661Alpha3,
    this.iso31662,
    this.category,
    this.type,
    this.city,
    this.town,
    this.continent,
    this.country,
    this.countryCode,
    this.county,
    this.municipality,
    this.parking,
    this.politicalUnion,
    this.postcode,
    this.region,
    this.road,
    this.state,
    this.stateCode,
    this.stateDistrict,
    this.suburb,
  });

  String? iso31661Alpha2;
  String? iso31661Alpha3;
  List<String>? iso31662;
  String? category;
  String? type;
  String? city;
  String? town;
  String? continent;
  String? country;
  String? countryCode;
  String? county;
  String? municipality;
  String? parking;
  String? politicalUnion;
  String? postcode;
  String? region;
  String? road;
  String? state;
  String? stateCode;
  String? stateDistrict;
  String? suburb;

  factory Components.fromJson(Map<String, dynamic> json) => Components(
        iso31661Alpha2: json["ISO_3166-1_alpha-2"],
        iso31661Alpha3: json["ISO_3166-1_alpha-3"],
        iso31662: List<String>.from(json["ISO_3166-2"].map((x) => x)),
        category: json["_category"],
        type: json["_type"],
        city: json["city"],
        town: json["town"],
        continent: json["continent"],
        country: json["country"],
        countryCode: json["country_code"],
        county: json["county"],
        municipality: json["municipality"],
        parking: json["parking"],
        politicalUnion: json["political_union"],
        postcode: json["postcode"],
        region: json["region"],
        road: json["road"],
        state: json["state"],
        stateCode: json["state_code"],
        stateDistrict: json["state_district"],
        suburb: json["suburb"],
      );

  Map<String, dynamic> toJson() => {
        "ISO_3166-1_alpha-2": iso31661Alpha2,
        "ISO_3166-1_alpha-3": iso31661Alpha3,
        "ISO_3166-2": List<dynamic>.from(iso31662!.map((x) => x)),
        "_category": category,
        "_type": type,
        "city": city,
        "town": town,
        "continent": continent,
        "country": country,
        "country_code": countryCode,
        "county": county,
        "municipality": municipality,
        "parking": parking,
        "political_union": politicalUnion,
        "postcode": postcode,
        "region": region,
        "road": road,
        "state": state,
        "state_code": stateCode,
        "state_district": stateDistrict,
        "suburb": suburb,
      };
}

class Status {
  Status({
    this.code,
    this.message,
  });

  int? code;
  String? message;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class StayInformed {
  StayInformed({
    this.blog,
    this.mastodon,
    this.twitter,
  });

  String? blog;
  String? mastodon;
  String? twitter;

  factory StayInformed.fromJson(Map<String, dynamic> json) => StayInformed(
        blog: json["blog"],
        mastodon: json["mastodon"],
        twitter: json["twitter"],
      );

  Map<String, dynamic> toJson() => {
        "blog": blog,
        "mastodon": mastodon,
        "twitter": twitter,
      };
}

class Timestamp {
  Timestamp({
    this.createdHttp,
    this.createdUnix,
  });

  String? createdHttp;
  int? createdUnix;

  factory Timestamp.fromJson(Map<String, dynamic> json) => Timestamp(
        createdHttp: json["created_http"],
        createdUnix: json["created_unix"],
      );

  Map<String, dynamic> toJson() => {
        "created_http": createdHttp,
        "created_unix": createdUnix,
      };
}
