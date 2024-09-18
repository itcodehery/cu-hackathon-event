import 'package:cu_hackathon_main/components/data_breach_card.dart';
import 'package:cu_hackathon_main/components/email_analytics_card.dart';
import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XposedOrNot'),
      ),
      body: Column(
        children: [
          GridView.builder(
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
                  } else {
                    Navigator.of(context).pushNamed('/email_breach_analytics');
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
          const DataBreachCard(),
          const EmailAnalyticsCard(),
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
                } else {
                  Navigator.of(context).pushNamed('/email_breach_analytics');
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
