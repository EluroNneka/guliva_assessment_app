import 'package:get/get.dart';
import 'package:guliva_assessment_app/ui/views/login/login_controller.dart';
import 'package:guliva_assessment_app/ui/views/register/register_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  }
}
