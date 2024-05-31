import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/presentation/router/router_imports.gr.dart';
import 'package:my_notes/views/home.dart';

import '../AppPreferences.dart';
import '../core/constants/routes.dart';
import '../core/constants/sharepreferanceskeys.dart';


@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                AutoRouter.of(
                  context
                ).push(const HomeRoute());
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
