part of 'splash_imports.dart';


@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseRemoteConfig>(
      future: fetchRemoteConfig(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final config = snapshot.data!;

          if (AppPreferences().getBool(isUserLogin,defaultValue: false)) {
            AutoRouter.of(
                  context
                ).push(const HomeRoute());
          } else {
           AutoRouter.of(
                  context
                ).push(const LoginRoute());
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