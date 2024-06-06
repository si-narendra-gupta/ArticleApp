part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor));

    return FutureBuilder<FirebaseRemoteConfig>(
      future: fetchRemoteConfig(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (AppPreferences().getBool(isUserLogin, defaultValue: false)) {
            AutoRouter.of(context).push(const HomeRoute());
          } else {
            AutoRouter.of(context).push(const OnBoardRoute());
          }
        } else if (snapshot.hasError) {
          // Handle error
          return const Scaffold(
            backgroundColor: MyColors.primaryColor,
            body: Center(child: Text("Failed to Load Config...")),
          );
        }
        return Scaffold(
          backgroundColor: MyColors.primaryColor,
          body: Center(child: Image.asset(MyAssets.splashLogo)),
        );
      },
    );
  }
}
