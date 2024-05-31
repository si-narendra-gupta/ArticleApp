import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/core/constants/my_string.dart';
import 'package:my_notes/core/constants/routes.dart';
import 'package:my_notes/core/themes/app_themes.dart';
import 'package:my_notes/presentation/router/router_imports.dart';
import 'package:my_notes/views/login.dart';

import 'AppPreferences.dart';
import 'core/constants/sharepreferanceskeys.dart';
import 'views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await AppPreferences().init();
  final _appRouter = AppRouter();

  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: MyStrings.appName,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      routerConfig: _appRouter.config(),
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
            return const Home();
          } else {
            return const Login();
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
          title: MyStrings.loading,
          home: Text(MyStrings.loading),
        );
      },
    );
  }
}
