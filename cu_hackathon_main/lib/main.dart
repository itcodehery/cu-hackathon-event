import 'package:cu_hackathon_main/helper/shared_prefs_helper.dart';
import 'package:cu_hackathon_main/pages/data_breach_page.dart';
import 'package:cu_hackathon_main/pages/home_page.dart';
import 'package:cu_hackathon_main/pages/password_security_page.dart';
import 'package:cu_hackathon_main/pages/settings_page.dart';
import 'package:cu_hackathon_main/pages/verified_breach_page.dart';
import 'package:cu_hackathon_main/pages/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const XposedOrNot());
}

class XposedOrNot extends StatelessWidget {
  const XposedOrNot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breach',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.jostTextTheme(),
      ),
      routes: {
        '/': (context) => const WidgetTree(),
        '/home': (context) => const HomePage(),
        '/data_breach': (context) => const DataBreachPage(),
        '/general_breaches': (context) => const DataBreachPage(),
        '/password_security': (context) => const PasswordSecurityPage(),
        '/settings': (context) => const SettingsPage(),
        '/verified_breaches': (context) => const VerifiedBreachesPage(),
      },
    );
  }
}
