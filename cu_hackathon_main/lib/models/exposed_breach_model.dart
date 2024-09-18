class ExposedBreachModel {
  String? breachID;
  DateTime? breachedDate;
  String? domain;
  List<String>? exposedData;
  int? exposedRecords;
  String? exposedDescription;
  String? industry;
  String? logoUrl;
  String? passwordRisk;

  ExposedBreachModel({
    required this.breachID,
    required this.breachedDate,
    required this.domain,
    required this.exposedData,
    required this.exposedRecords,
    required this.exposedDescription,
    required this.industry,
    required this.logoUrl,
    required this.passwordRisk,
  });

  factory ExposedBreachModel.fromJson(Map<String, dynamic> json) {
    return ExposedBreachModel(
      breachID: json['breachID'] ?? 'No data found',
      breachedDate: DateTime.parse(json['breachedDate']),
      domain: json['domain'] ?? 'No data found',
      exposedData: List<String>.from(json['exposedData']),
      exposedRecords: json['exposedRecords'] ?? 0,
      exposedDescription: json['exposureDescription'] ?? 'No data found',
      industry: json['industry'] ?? 'No data found',
      logoUrl: json['logo'] ?? 'No data found',
      passwordRisk: json['passwordRisk'] ?? 'No data found',
    );
  }
}
