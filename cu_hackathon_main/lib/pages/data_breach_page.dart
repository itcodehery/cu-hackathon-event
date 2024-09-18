import 'package:cu_hackathon_main/components/security_card.dart';
import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:cu_hackathon_main/helper/shared_prefs_helper.dart';
import 'package:cu_hackathon_main/providers/endpoint_providers.dart';
import 'package:flutter/material.dart';

class DataBreachPage extends StatefulWidget {
  const DataBreachPage({super.key});

  @override
  _DataBreachPageState createState() => _DataBreachPageState();
}

class _DataBreachPageState extends State<DataBreachPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  List<String> breaches = [];

  Future<void> fetchDB() async {
    List<String> res = [];
    try {
      res = await fetchDataBreaches(keyEmail);
      setState(() {
        breaches = res;
      });
    } catch (e) {
      res = [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...buildAppBar(context),
        const SecurityCard(),
        if (breaches.isNotEmpty) ...[
          ListTile(
            tileColor: Colors.red,
            leading: const Icon(Icons.warning, color: Colors.white),
            title: const Text("Breaches found!",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text(
                "Your email's data has been breached in ${breaches.length} site(s).",
                style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: breaches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(breaches[index]),
                );
              },
            ),
          ),
        ] else ...[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Checking your email for Data Breaches",
                style: TextStyle(fontSize: 32)),
          ),
          const LinearProgressIndicator(),
        ]
      ]),
    );
  }
}
