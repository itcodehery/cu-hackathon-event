import 'package:flutter/material.dart';

const String keyEmail = "a@gmail.com";

final List<String> homeButtonNames = [
  "Check Data Breaches",
  "Email Breach Analytics",
  "Password Breach Anon",
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
