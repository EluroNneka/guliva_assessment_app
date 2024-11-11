import 'package:get/get.dart';
import 'package:guliva_assessment_app/ui/views/binding/app_binding.dart';
import 'package:guliva_assessment_app/ui/views/login/login_view.dart';
import 'package:guliva_assessment_app/ui/views/register/register_view.dart';
import 'package:guliva_assessment_app/ui/views/splash_view.dart';

class Routes {
  static const String splash = '/splash';
  static const String register = '/register';
  static const String login = '/login';
}

///This class handles navigation in the app
class Routers {
  final List<GetPage> views = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      binding: AppBinding(),
    ),
  ];
}
