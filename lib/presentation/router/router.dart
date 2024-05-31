part of 'router_imports.dart';


@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {

 @override
 List<AutoRoute> get routes => [
   AutoRoute(page: SplashRoute.page,path: "/"),
   AutoRoute(page: LoginRoute.page),
   AutoRoute(page: HomeRoute.page),
 ];
}