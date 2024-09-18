// To parse this JSON data, do
//
//     final verifiedBreaches = verifiedBreachesFromJson(jsonString);

import 'dart:convert';

VerifiedBreaches verifiedBreachesFromJson(String str) =>
    VerifiedBreaches.fromJson(json.decode(str));

String verifiedBreachesToJson(VerifiedBreaches data) =>
    json.encode(data.toJson());

class VerifiedBreaches {
  Metrics metrics;
  String status;

  VerifiedBreaches({
    required this.metrics,
    required this.status,
  });

  factory VerifiedBreaches.fromJson(Map<String, dynamic> json) =>
      VerifiedBreaches(
        metrics: Metrics.fromJson(json["metrics"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "metrics": metrics.toJson(),
        "status": status,
      };
}

class Metrics {
  BreachSummary breachSummary;
  List<BreachesDetail> breachesDetails;
  DetailedBreachInfo detailedBreachInfo;
  DomainSummary domainSummary;
  BreachSummary top10Breaches;
  Map<String, int> yearlyMetrics;

  Metrics({
    required this.breachSummary,
    required this.breachesDetails,
    required this.detailedBreachInfo,
    required this.domainSummary,
    required this.top10Breaches,
    required this.yearlyMetrics,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) => Metrics(
        breachSummary: BreachSummary.fromJson(json["Breach_Summary"]),
        breachesDetails: List<BreachesDetail>.from(
            json["Breaches_Details"].map((x) => BreachesDetail.fromJson(x))),
        detailedBreachInfo:
            DetailedBreachInfo.fromJson(json["Detailed_Breach_Info"]),
        domainSummary: DomainSummary.fromJson(json["Domain_Summary"]),
        top10Breaches: BreachSummary.fromJson(json["Top10_Breaches"]),
        yearlyMetrics: Map.from(json["Yearly_Metrics"])
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "Breach_Summary": breachSummary.toJson(),
        "Breaches_Details":
            List<dynamic>.from(breachesDetails.map((x) => x.toJson())),
        "Detailed_Breach_Info": detailedBreachInfo.toJson(),
        "Domain_Summary": domainSummary.toJson(),
        "Top10_Breaches": top10Breaches.toJson(),
        "Yearly_Metrics": Map.from(yearlyMetrics)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class BreachSummary {
  int aerServ;

  BreachSummary({
    required this.aerServ,
  });

  factory BreachSummary.fromJson(Map<String, dynamic> json) => BreachSummary(
        aerServ: json["AerServ"],
      );

  Map<String, dynamic> toJson() => {
        "AerServ": aerServ,
      };
}

class BreachesDetail {
  String breach;
  String domain;
  String email;

  BreachesDetail({
    required this.breach,
    required this.domain,
    required this.email,
  });

  factory BreachesDetail.fromJson(Map<String, dynamic> json) => BreachesDetail(
        breach: json["breach"],
        domain: json["domain"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "breach": breach,
        "domain": domain,
        "email": email,
      };
}

class DetailedBreachInfo {
  AerServ aerServ;

  DetailedBreachInfo({
    required this.aerServ,
  });

  factory DetailedBreachInfo.fromJson(Map<String, dynamic> json) =>
      DetailedBreachInfo(
        aerServ: AerServ.fromJson(json["AerServ"]),
      );

  Map<String, dynamic> toJson() => {
        "AerServ": aerServ.toJson(),
      };
}

class AerServ {
  String breachedDate;
  String logo;
  String passwordRisk;
  String searchable;
  String xposedData;
  int xposedRecords;
  String xposureDesc;

  AerServ({
    required this.breachedDate,
    required this.logo,
    required this.passwordRisk,
    required this.searchable,
    required this.xposedData,
    required this.xposedRecords,
    required this.xposureDesc,
  });

  factory AerServ.fromJson(Map<String, dynamic> json) => AerServ(
        breachedDate: json["breached_date"],
        logo: json["logo"],
        passwordRisk: json["password_risk"],
        searchable: json["searchable"],
        xposedData: json["xposed_data"],
        xposedRecords: json["xposed_records"],
        xposureDesc: json["xposure_desc"],
      );

  Map<String, dynamic> toJson() => {
        "breached_date": breachedDate,
        "logo": logo,
        "password_risk": passwordRisk,
        "searchable": searchable,
        "xposed_data": xposedData,
        "xposed_records": xposedRecords,
        "xposure_desc": xposureDesc,
      };
}

class DomainSummary {
  int xposedornotCom;

  DomainSummary({
    required this.xposedornotCom,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) => DomainSummary(
        xposedornotCom: json["xposedornot.com"],
      );

  Map<String, dynamic> toJson() => {
        "xposedornot.com": xposedornotCom,
      };
}
