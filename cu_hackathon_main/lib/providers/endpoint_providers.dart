import 'dart:convert';

import 'package:cu_hackathon_main/models/breach.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<String>> fetchDataBreaches(String email) async {
  Set<String> result = {};
  try {
    debugPrint("Inside fetchDataBreaches");
    final response = await http
        .get(Uri.parse('https://api.xposedornot.com/v1/check-email/$email'));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      for (var i in res['breaches'][0]) {
        result.add(i);
      }
      debugPrint(result.toString());
      return result.toList();
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

Future<String> fetchDataBreachAnalytics(String email) async {
  try {
    final response = await http.get(Uri.parse(
        'https://api.xposedornot.com/v1/breach-analytics?email=$email'));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return res.toString();
    } else {
      return 'No analytics found';
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}
