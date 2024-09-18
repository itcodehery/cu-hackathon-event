import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:cu_hackathon_main/pages/data_breach_page.dart';
import 'package:cu_hackathon_main/pages/home_page.dart';
import 'package:cu_hackathon_main/pages/password_security_page.dart';
import 'package:cu_hackathon_main/pages/security_app_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomePage(),
        const DataBreachPage(),
        const PasswordSecurityPage(),
      ][_currentIndex],
      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(
          onTap: (p0) {
            setState(() {
              _currentIndex = p0;
            });
          },
          currentIndex: _currentIndex,
          items: [
            CrystalNavigationBarItem(
                icon: Icons.home_outlined,
                selectedColor: globalPrimaryColor,
                unselectedColor: Colors.black),
            CrystalNavigationBarItem(
                icon: Icons.mail_lock_outlined,
                selectedColor: globalPrimaryColor,
                unselectedColor: Colors.black),
            CrystalNavigationBarItem(
                icon: Icons.password_outlined,
                selectedColor: globalPrimaryColor,
                unselectedColor: Colors.black),
          ]),
    );
  }
}
