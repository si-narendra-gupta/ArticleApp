
// ignore_for_file: use_build_context_synchronously

part of  'login_imports.dart';


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
        backgroundColor:Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(MyAssets.brandLogo),
          const Text("Welcome to the den!",
              style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor)),
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
