import 'package:cu_hackathon_main/models/verified_breaches.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; // Import your model file here

class VerifiedBreachesPage extends StatefulWidget {
  const VerifiedBreachesPage({super.key});

  @override
  State<VerifiedBreachesPage> createState() => _VerifiedBreachesPageState();
}

class _VerifiedBreachesPageState extends State<VerifiedBreachesPage> {
  VerifiedBreaches? _verifiedBreaches;

  @override
  void initState() {
    super.initState();
    _loadData(); // Simulate data loading
  }

  // Simulate fetching data by loading a static JSON
  void _loadData() {
    String jsonData = '''
    {
      "metrics": {
        "Breach_Summary": {"AerServ": 10},
        "Breaches_Details": [
          {"breach": "Breach1", "domain": "example.com", "email": "user1@example.com"},
          {"breach": "Breach2", "domain": "test.com", "email": "user2@test.com"}
        ],
        "Detailed_Breach_Info": {
          "AerServ": {
            "breached_date": "2022-05-05",
            "logo": "https://example.com/logo.png",
            "password_risk": "High",
            "searchable": "Yes",
            "xposed_data": "Password, Emails",
            "xposed_records": 1000000,
            "xposure_desc": "Data exposed in May 2022"
          }
        },
        "Domain_Summary": {"xposedornot.com": 5},
        "Top10_Breaches": {"AerServ": 10},
        "Yearly_Metrics": {"2021": 50, "2022": 100}
      },
      "status": "success"
    }
    ''';

    // Parse the JSON and update the state
    setState(() {
      _verifiedBreaches = verifiedBreachesFromJson(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verified Breaches'),
      ),
      body: _verifiedBreaches == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Breach Summary',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        'AerServ: ${_verifiedBreaches!.metrics.breachSummary.aerServ} breaches'),
                    const SizedBox(height: 16),
                    const Text(
                      'Breaches Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          _verifiedBreaches!.metrics.breachesDetails.length,
                      itemBuilder: (context, index) {
                        final breach =
                            _verifiedBreaches!.metrics.breachesDetails[index];
                        return ListTile(
                          title: Text(breach.breach),
                          subtitle: Text('${breach.domain} | ${breach.email}'),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Detailed Breach Info (AerServ)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        'Breached Date: ${_verifiedBreaches!.metrics.detailedBreachInfo.aerServ.breachedDate}'),
                    Text(
                        'Password Risk: ${_verifiedBreaches!.metrics.detailedBreachInfo.aerServ.passwordRisk}'),
                    Text(
                        'Exposed Data: ${_verifiedBreaches!.metrics.detailedBreachInfo.aerServ.xposedData}'),
                    Text(
                        'Records Exposed: ${_verifiedBreaches!.metrics.detailedBreachInfo.aerServ.xposedRecords}'),
                    const SizedBox(height: 16),
                    const Text(
                      'Yearly Metrics',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ..._verifiedBreaches!.metrics.yearlyMetrics.entries
                        .map((entry) {
                      return Text('${entry.key}: ${entry.value} breaches');
                    }),
                  ],
                ),
              ),
            ),
    );
  }
}
