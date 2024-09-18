import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:cu_hackathon_main/components/security_card.dart';
import 'package:cu_hackathon_main/helper/constants.dart';
import 'package:cu_hackathon_main/models/password_exposure_model.dart';
import 'package:cu_hackathon_main/providers/endpoint_providers.dart';
import 'package:flutter/material.dart';

class PasswordSecurityPage extends StatefulWidget {
  const PasswordSecurityPage({super.key});

  @override
  State<PasswordSecurityPage> createState() => _PasswordSecurityPageState();
}

class _PasswordSecurityPageState extends State<PasswordSecurityPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  PasswordExposure? passwordExposure;
  bool isLoading = false;

  void _checkPassword() async {
    if (_key.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Checking password security...'),
        ),
      );
      setState(() {
        isLoading = true;
      });
      var hashedPassword = sha256
          .convert(utf8.encode(_passwordController.text.trim()))
          .toString();
      debugPrint(hashedPassword.toString());
      PasswordExposure res = PasswordExposure(
        anon: 'anon',
        characteristics: 'char',
        count: 0,
        wordlist: 0,
      );
      try {
        PasswordExposure res = await fetchPasswordDetails(hashedPassword);
      } catch (e) {
        debugPrint(e.toString());
      }
      setState(() {
        passwordExposure = res;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...buildAppBar(context),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const Text(
                          "Enter your password to check its security:",
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: globalPrimaryColor)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: globalPrimaryColor.withOpacity(0.4),
        elevation: 0,
        onPressed: () {
          _checkPassword();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
