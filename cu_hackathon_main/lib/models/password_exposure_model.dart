class PasswordExposure {
  final String anon;
  final String characteristics;
  final int count;
  final int wordlist;

  PasswordExposure({
    required this.anon,
    required this.characteristics,
    required this.count,
    required this.wordlist,
  });

  // Factory constructor to create a PasswordExposure instance from a JSON map
  factory PasswordExposure.fromJson(Map<String, dynamic> json) {
    return PasswordExposure(
      anon: json['SearchPassAnon']['anon'],
      characteristics: json['SearchPassAnon']['char'],
      count: int.parse(json['SearchPassAnon']['count']),
      wordlist: json['SearchPassAnon']['wordlist'],
    );
  }

  // Convert a PasswordExposure instance back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'SearchPassAnon': {
        'anon': anon,
        'char': characteristics.toString(),
        'count': count.toString(),
        'wordlist': wordlist,
      },
    };
  }
}
