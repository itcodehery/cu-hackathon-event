import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:flutter/material.dart';

class SecurityCard extends StatelessWidget {
  const SecurityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/maincardbg.jpg'),
              fit: BoxFit.cover,
              opacity: 0.8),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              "Secure your digital world by staying ahead of data breaches and exposed passwords",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "Your first line of defense is knowing when you've been compromised",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
