import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:flutter/material.dart';

class EmailAnalyticsCard extends StatelessWidget {
  const EmailAnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ListTile(
              title: Text("Vaibhav Murugendra"),
              subtitle: Text(keyEmail),
              trailing: Icon(Icons.verified),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            ListTile(
              title: const Text('Breach Analysis'),
              trailing: TextButton(
                  style: homeButtonStyle2,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/data_breach');
                  },
                  child: const Text("Check for breaches")),
            ),
          ],
        ),
      ),
    );
  }
}
