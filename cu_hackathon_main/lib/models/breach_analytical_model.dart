class BreachAnalyticalModel {
  BreachMetrics breachMetrics;
  BreachSummary breachSummary;
  ExposedBreaches exposedBreaches;
  String pasteSummary;

  BreachAnalyticalModel(
      {required this.breachMetrics,
      required this.breachSummary,
      required this.exposedBreaches,
      required this.pasteSummary});

  factory BreachAnalyticalModel.fromJson(Map<String, dynamic> json) {
    return BreachAnalyticalModel(
      breachMetrics: BreachMetrics.fromJson(json['BreachMetrics']),
      breachSummary: BreachSummary.fromJson(json['BreachesSummary']),
      exposedBreaches: ExposedBreaches.fromJson(json['ExposedBreaches']),
      pasteSummary: json['PasteSummary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BreachMetrics': breachMetrics,
      'BreachSummary': breachSummary,
      'ExposedBreaches': exposedBreaches,
      'PasteSummary': pasteSummary,
    };
  }
}

class BreachMetrics {
  List<String> getDetails;
  List<String> industry;
  Map<String, dynamic> passwordStrength; // get 0th index
  Map<String, dynamic> risk; // get 0th index
  List<String> yearwiseDetails; // get 0th index

  BreachMetrics(
      {required this.getDetails,
      required this.industry,
      required this.passwordStrength,
      required this.risk,
      required this.yearwiseDetails});

  factory BreachMetrics.fromJson(Map<String, dynamic> json) {
    return BreachMetrics(
      getDetails: List<String>.from(json['getDetails']),
      industry: List<String>.from(json['industry']),
      passwordStrength: json['passwordStrength'][0],
      risk: json['risk'][0],
      yearwiseDetails: List<String>.from(json['yearwiseDetails'][0]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'getDetails': getDetails,
      'industry': industry,
      'passwordStrength': passwordStrength,
      'risk': risk,
      'yearwiseDetails': yearwiseDetails,
    };
  }
}

class BreachSummary {
  String site;

  BreachSummary({required this.site});

  factory BreachSummary.fromJson(Map<String, dynamic> json) {
    return BreachSummary(
      site: json['site'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'site': site,
    };
  }
}

class ExposedBreaches {
  Map<String, dynamic> breachesDetails;

  ExposedBreaches({required this.breachesDetails});

  factory ExposedBreaches.fromJson(Map<String, dynamic> json) {
    return ExposedBreaches(
      breachesDetails: json['breachesDetails'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'breachesDetails': breachesDetails,
    };
  }
}
