
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/core/constants/my_string.dart';
import 'package:my_notes/core/themes/app_themes.dart';
import 'package:my_notes/presentation/router/router_imports.dart';
import 'AppPreferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await AppPreferences().init();
  final _appRouter = await AppRouter();

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: MyStrings.appName,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          routerConfig: _appRouter.config(),
        );
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
