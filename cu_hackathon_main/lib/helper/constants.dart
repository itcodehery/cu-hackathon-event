import 'package:flutter/material.dart';

const String keyEmail = "a@gmail.com";

const globalPrimaryColor = Color.fromARGB(255, 18, 173, 215);

final List<String> homeButtonNames = [
  "Check Data Breaches",
  "General Breaches",
  "Password Breaches",
];

final ButtonStyle homeButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all<Color>(Colors.black26),
  foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  overlayColor: WidgetStateProperty.all<Color>(Colors.black12),
);

final ButtonStyle homeButtonStyle2 = ButtonStyle(
  backgroundColor:
      WidgetStateProperty.all<Color>(globalPrimaryColor.withOpacity(0.3)),
  foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.all(10),
  ),
  overlayColor: WidgetStateProperty.all<Color>(Colors.black12),
);

List<Widget> buildAppBar(BuildContext context) {
  return [
    const SizedBox(
      height: 50,
    ),
    ListTile(
      trailing: IconButton(
        style: homeButtonStyle2,
        icon: const Icon(Icons.settings_outlined, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pushNamed("/settings");
        },
      ),
      title: const Text('Good day,'),
      subtitle: const Text(
        "Vaibhav Murugendra",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    const SizedBox(
      height: 20,
    ),
  ];
}

Map<String, void Function()> settings = {
  "Change Email": () {},
  "Help": () {},
  "Feedback": () {},
  "Privacy Policy": () {},
  "Terms and Conditions": () {},
  "Licenses": () {},
  "Version": () {},
};
