import 'package:cu_hackathon_main/models/email_analytics_model.dart';
import 'package:cu_hackathon_main/providers/endpoint_providers.dart';
import 'package:flutter/material.dart';

class SecurityAppPage extends StatefulWidget {
  const SecurityAppPage({super.key});

  @override
  State<SecurityAppPage> createState() => _SecurityAppPageState();
}

class _SecurityAppPageState extends State<SecurityAppPage> {
  EmailAnalyticsModel? data;
  Future<void> fetchEA() async {
    try {
      final res = await fetchDataBreachAnalytics("123@gmail.com");
      setState(() {
        data = res;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEA();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Analysis Detailed Information"),
      ),
      body: data != null
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Breach Metrics'),
                  _buildBreachMetrics(data!.breachMetrics),
                  _buildSectionTitle('Exposed Breaches'),
                  _buildExposedBreaches(data!.exposedBreaches),
                  const Divider(),
                  _buildSectionTitle('Pastes Summary'),
                  _buildPastesSummary(data!.pastesSummary),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  // Breach Metrics section
  Widget _buildBreachMetrics(BreachMetrics breachMetrics) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: const Icon(Icons.warning_amber, color: Colors.red),
              title: Text(
                  "${breachMetrics.industry.length} industries affected",
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const Center(
              child: Text(
                'Passwords Strengths:',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: breachMetrics.passwordsStrength.map((strength) {
                return Text(
                  'Easy to Crack: ${strength.easyToCrack}, Plain Text: ${strength.plainText}, Strong Hash: ${strength.strongHash}, Unknown: ${strength.unknown}',
                  textAlign: TextAlign.center,
                );
              }).toList(),
            ),
            const Center(
              child: Text(
                'Risk:',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: breachMetrics.risk.map((risk) {
                  return Text(
                    'Risk: ${risk.riskLabel}, Score: ${risk.riskScore}',
                    textAlign: TextAlign.center,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Exposed Breaches section
  Widget _buildExposedBreaches(ExposedBreaches exposedBreaches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: exposedBreaches.breachesDetails.map((breachDetail) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ListTile(
                //   title: Text(breachDetail.breach),
                //   subtitle: Text(breachDetail.details),
                // ),
                Text(breachDetail.breach,
                    style: const TextStyle(fontSize: 20.0)),
                Text(breachDetail.domain),

                Text(breachDetail.details,
                    style: const TextStyle(fontSize: 16.0)),

                Chip(
                  label: Text('Industry: ${breachDetail.industry}'),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // Pastes Summary section
  Widget _buildPastesSummary(PastesSummary pastesSummary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pastes Count: ${pastesSummary.cnt}'),
        Text('Domain: ${pastesSummary.domain}'),
        Text('Timestamp: ${pastesSummary.tmpstmp}'),
      ],
    );
  }

  // Helper widget for section titles
  Widget _buildSectionTitle(String title) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
