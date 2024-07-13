import 'package:get/get.dart';
import 'package:mvvm_practice/res/routes/routes_name.dart';
import 'package:mvvm_practice/view/home/home_screen.dart';
import 'package:mvvm_practice/view/login/login_screen.dart';
import 'package:mvvm_practice/view/splash_screen.dart';

class AppRoutes {
  static appRoute() => [
        GetPage(
            name: RouteNames.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.circularReveal),
        GetPage(
            name: RouteNames.loginScreen,
            page: () => const LoginScreen(),
            transition: Transition.circularReveal),
        GetPage(
            name: RouteNames.homeScreen,
            page: () => const HomeScreen(),
            transition: Transition.circularReveal),
      ];
}
