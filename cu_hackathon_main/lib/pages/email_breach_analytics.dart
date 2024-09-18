import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:cu_hackathon_main/providers/endpoint_providers.dart';
import 'package:flutter/material.dart';

class EmailBreachAnalytics extends StatefulWidget {
  const EmailBreachAnalytics({super.key});

  @override
  State<EmailBreachAnalytics> createState() => _EmailBreachAnalyticsState();
}

class _EmailBreachAnalyticsState extends State<EmailBreachAnalytics> {
  String? analytics;

  Future<void> fetchDBA() async {
    String res = '';
    debugPrint("Inside fetchDBA");
    try {
      res = await fetchDataBreachAnalytics(keyEmail);
      setState(() {
        analytics = res;
      });
    } catch (e) {
      res = '';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDBA();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Breach Analytics'),
      ),
      body: Center(
        child: analytics == null
            ? const CircularProgressIndicator()
            : Text(
                analytics!,
                style: const TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
