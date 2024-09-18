// To parse this JSON data, do
//
//     final exposedBreaches = exposedBreachesFromJson(jsonString);

import 'dart:convert';

ExposedBreaches exposedBreachesFromJson(String str) =>
    ExposedBreaches.fromJson(json.decode(str));

String exposedBreachesToJson(ExposedBreaches data) =>
    json.encode(data.toJson());

class ExposedBreaches {
  List<ExposedBreach> exposedBreaches;

  ExposedBreaches({
    required this.exposedBreaches,
  });

  factory ExposedBreaches.fromJson(Map<String, dynamic> json) =>
      ExposedBreaches(
        exposedBreaches: List<ExposedBreach>.from(
            json["exposedBreaches"].map((x) => ExposedBreach.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exposedBreaches":
            List<dynamic>.from(exposedBreaches.map((x) => x.toJson())),
      };
}

class ExposedBreach {
  String breachId;
  DateTime breachedDate;
  String domain;
  List<String> exposedData;
  int exposedRecords;
  String exposureDescription;
  String industry;
  String logo;
  String passwordRisk;
  String referenceUrl;
  bool searchable;
  bool sensitive;
  bool verified;

  ExposedBreach({
    required this.breachId,
    required this.breachedDate,
    required this.domain,
    required this.exposedData,
    required this.exposedRecords,
    required this.exposureDescription,
    required this.industry,
    required this.logo,
    required this.passwordRisk,
    required this.referenceUrl,
    required this.searchable,
    required this.sensitive,
    required this.verified,
  });

  factory ExposedBreach.fromJson(Map<String, dynamic> json) => ExposedBreach(
        breachId: json["breachID"],
        breachedDate: DateTime.parse(json["breachedDate"]),
        domain: json["domain"],
        exposedData: List<String>.from(json["exposedData"].map((x) => x)),
        exposedRecords: json["exposedRecords"],
        exposureDescription: json["exposureDescription"],
        industry: json["industry"],
        logo: json["logo"],
        passwordRisk: json["passwordRisk"],
        referenceUrl: json["referenceURL"],
        searchable: json["searchable"],
        sensitive: json["sensitive"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "breachID": breachId,
        "breachedDate": breachedDate.toIso8601String(),
        "domain": domain,
        "exposedData": List<dynamic>.from(exposedData.map((x) => x)),
        "exposedRecords": exposedRecords,
        "exposureDescription": exposureDescription,
        "industry": industry,
        "logo": logo,
        "passwordRisk": passwordRisk,
        "referenceURL": referenceUrl,
        "searchable": searchable,
        "sensitive": sensitive,
        "verified": verified,
      };
}
