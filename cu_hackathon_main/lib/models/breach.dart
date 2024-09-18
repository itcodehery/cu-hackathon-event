class Breach {
  final List<String> data;

  Breach({required this.data});

  factory Breach.fromJson(Map<String, dynamic> json) {
    return Breach(
      data: List<String>.from(json['breaches']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'breaches': data,
    };
  }
}
