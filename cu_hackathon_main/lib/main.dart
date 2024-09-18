import 'package:cu_hackathon_main/helper/shared_prefs_helper.dart';
import 'package:cu_hackathon_main/pages/data_breach_page.dart';
import 'package:cu_hackathon_main/pages/email_breach_analytics.dart';
import 'package:cu_hackathon_main/pages/home_page.dart';
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
      title: 'XposedOrNot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.jostTextTheme(),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/data_breach': (context) => const DataBreachPage(),
        '/email_breach_analytics': (context) => const EmailBreachAnalytics(),
      },
    );
  }
}
