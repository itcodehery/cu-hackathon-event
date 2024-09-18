import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          for (var i in settings.keys)
            ListTile(
              title: Text(i),
              onTap: settings[i],
            ),
        ],
      ),
    );
  }
}
