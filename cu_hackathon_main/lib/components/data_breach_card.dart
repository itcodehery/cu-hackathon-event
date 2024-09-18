import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:cu_hackathon_main/models/exposed_breach_model.dart';
import 'package:flutter/material.dart';

class DataBreachCard extends StatelessWidget {
  const DataBreachCard({super.key, required this.breach});

  final ExposedBreachModel breach;

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       children: [
    //         ListTile(
    //           title: const Text('Email Data Breaches'),
    //           trailing: TextButton(
    //               onPressed: () {
    //                 Navigator.of(context).pushNamed('/data_breach');
    //               },
    //               child: const Text("Check for breaches")),
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 8.0),
    //           child: Divider(),
    //         ),
    //         ListTile(
    //           title: const Text(keyEmail),
    //           subtitle: const Text("No breaches found!"),
    //           trailing: IconButton(
    //             icon: const Icon(Icons.edit_outlined),
    //             onPressed: () {},
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(breach.breachID!),
            // subtitle: Text(breach.breachedDate!),
            // format date
            subtitle: Text(breach.breachedDate!.toString().substring(0, 10)),
            trailing: Chip(label: Text(breach.industry!)),
          ),
          ListTile(
            title: Text(breach.domain!),
            subtitle: Text("${breach.exposedRecords} records exposed"),
          ),
        ],
      ),
    );
  }
}
