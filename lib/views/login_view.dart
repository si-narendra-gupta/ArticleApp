import 'package:flutter/material.dart';

import '../AppPreferences.dart';
import '../constants/routes.dart';
import '../constants/sharepreferanceskeys.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/ic_brand_logo.webp'),
          Text("Welcome to the den!",
              style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          TextField(
            controller: _email,
            autocorrect: false,
            enableSuggestions: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Enter Your Email"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(hintText: "Enter Your Password"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              if (email.isNotEmpty && password.isNotEmpty) {
                await AppPreferences().setBool(isUserLogin, true);
                Navigator.pushNamed(context, homeRoute);
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
              onPressed: () {},
              child: const Text("Note Registered Yet? Register here!"))
        ],
      ),
    );
  }
}
