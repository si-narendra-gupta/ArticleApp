import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/views/login_view.dart';

import 'AppPreferences.dart';
import 'constants/sharepreferanceskeys.dart';
import 'views/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await AppPreferences().init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        homeRoute: (context) => const HomePage(),
      },
    ),
  );
}

Future<FirebaseRemoteConfig> fetchRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 15),
    minimumFetchInterval: const Duration(minutes: 15),
  ));

  await remoteConfig.fetchAndActivate();
  return remoteConfig;
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    //print(config.toString());
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseRemoteConfig>(
      future: fetchRemoteConfig(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final config = snapshot.data!;

          if (AppPreferences().getBool(isUserLogin,defaultValue: false)) {
            return const HomePage();
          } else {
            return const LoginView();
          }
        } else if (snapshot.hasError) {
          // Handle error
          return MaterialApp(
            title: 'Error',
            home: Text('Error'),
          );
        }
        // Show loading spinner or placeholder while fetching remote config
        return MaterialApp(
          title: 'Loading',
          home: Text('Loading'),
        );
      },
    );
  }
}
