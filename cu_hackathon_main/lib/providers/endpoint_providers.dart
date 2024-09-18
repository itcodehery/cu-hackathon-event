import 'dart:convert';

import 'package:cu_hackathon_main/models/password_exposure_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Endpoint #1 : Checking for Email Address Data Breaches
// Implementation DONE
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

// Endpoint #2 : Fetching Data Breach Analytics
Future<String> fetchDataBreachAnalytics(String email) async {
  try {
    final response = await http.get(Uri.parse(
        'https://api.xposedornot.com/v1/breach-analytics?email=123@gmail.com'));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return res.toString();
    } else {
      return 'No breaches detected!';
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

// Endpoint #4 : Fetching General Breaches
Future<Map<String, dynamic>> fetchGeneralBreaches() async {
  try {
    debugPrint("Inside fetchGeneralBreaches");
    final response = await http
        .get(Uri.parse('http://xon-api-test.xposedornot.com/v1/breaches'));
    debugPrint('Response: ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> res = jsonDecode(response.body);
      return res;
    } else {
      throw Exception('Failed to parse data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

// Endpoint #3 : Checking for Exposed Passwords anonymously
Future<PasswordExposure> fetchPasswordDetails(String hashedPassword) async {
  final first10digitsOfPassword = hashedPassword.substring(0, 10);
// http://xon-api-test.xposedornot.com/v1/breaches
  try {
    final response = await http.get(Uri.parse(
        'http://xon-api-test.xposedornot.com/v1/pass/anon/$first10digitsOfPassword'));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return PasswordExposure.fromJson(res);
    } else {
      throw Exception('Failed to load the data');
    }
  } catch (e) {
    throw Exception('Failed to load data ${e.toString()}');
  }
}
