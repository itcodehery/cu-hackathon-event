import 'dart:convert';

import 'package:cu_hackathon_main/components/data_breach_card.dart';
import 'package:cu_hackathon_main/components/email_analytics_card.dart';
import 'package:cu_hackathon_main/components/security_card.dart';
import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:cu_hackathon_main/models/exposed_breach_model.dart';
import 'package:cu_hackathon_main/pages/security_app_page.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...buildAppBar(context),
            const SecurityCard(),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: homeButtonStyle2.copyWith(
                          elevation: const WidgetStatePropertyAll(0),
                          minimumSize:
                              const WidgetStatePropertyAll(Size(120, 50)),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const SecurityAppPage();
                          }));
                        },
                        child: const Text('Email Analytics')),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        style: homeButtonStyle2.copyWith(
                          elevation: const WidgetStatePropertyAll(0),
                          minimumSize:
                              const WidgetStatePropertyAll(Size(120, 50)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/data_breach');
                        },
                        child: const Text('Check Breaches')),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        style: homeButtonStyle2.copyWith(
                          elevation: const WidgetStatePropertyAll(0),
                          minimumSize:
                              const WidgetStatePropertyAll(Size(120, 50)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/verified_breaches');
                        },
                        child: const Text('Verified Breaches')),
                  ],
                ),
              ),
            ),
            const EmailAnalyticsCard(),
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
              const SizedBox(),
            ],
          ],
        ),
      ),
    );
  }
}
