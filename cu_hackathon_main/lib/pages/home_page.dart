import 'dart:convert';

import 'package:cu_hackathon_main/components/data_breach_card.dart';
import 'package:cu_hackathon_main/components/email_analytics_card.dart';
import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:cu_hackathon_main/models/exposed_breach_model.dart';
import 'package:cu_hackathon_main/providers/endpoint_providers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ExposedBreachModel>? generalBreaches;
  Future<void> fetchAllBreaches() async {
    List<ExposedBreachModel> finalRes = [];
    try {
      final res = await fetchGeneralBreaches();
      for (var i in res['exposedBreaches']) {
        finalRes.add(ExposedBreachModel.fromJson(i));
      }
      setState(() {
        generalBreaches = finalRes;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllBreaches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {},
            ),
            title: const Text('Good day,'),
            subtitle: const Text(
              "Abin Saji",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (generalBreaches != null) ...[
            ListView.builder(
                itemCount: generalBreaches?.length ?? 0,
                itemBuilder: (context, index) {
                  if (generalBreaches == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return DataBreachCard(
                      breach: generalBreaches![index],
                    );
                  }
                })
          ] else ...[
            const Center(
              child: Text(' No breaches found!'),
            ),
          ],
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 0),
          itemBuilder: (context, index) {
            return Center(
                child: TextButton(
              style: homeButtonStyle,
              onPressed: () {
                if (index == 0) {
                  Navigator.of(context).pushNamed('/data_breach');
                } else if (index == 1) {
                  Navigator.of(context).pushNamed('/email_breach_analytics');
                } else {
                  Navigator.of(context).pushNamed('/password_security');
                }
              },
              child: Text(
                homeButtonNames[index],
                textAlign: TextAlign.center,
              ),
            ));
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
