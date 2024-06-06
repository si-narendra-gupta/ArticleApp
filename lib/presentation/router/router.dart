part of 'router_imports.dart';


@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material();

 @override
 List<CustomRoute> get routes => [
   CustomRoute(page: SplashRoute.page,path: "/",transitionsBuilder: TransitionsBuilders.slideRight),
   CustomRoute(page: LoginRoute.page,transitionsBuilder:TransitionsBuilders.slideRight),
   CustomRoute(page: OnBoardRoute.page,transitionsBuilder: TransitionsBuilders.slideRight),
   CustomRoute(page: AuthRoute.page,transitionsBuilder: TransitionsBuilders.slideRight),
   CustomRoute(page: HomeRoute.page,transitionsBuilder: TransitionsBuilders.slideRight),
 ];
}