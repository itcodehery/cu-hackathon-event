import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:flutter/material.dart';

class DataBreachCard extends StatelessWidget {
  const DataBreachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Email Data Breaches'),
              trailing: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/data_breach');
                  },
                  child: const Text("Check for breaches")),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            ListTile(
              title: const Text(keyEmail),
              subtitle: const Text("No breaches found!"),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
