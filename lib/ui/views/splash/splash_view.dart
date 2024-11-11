import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guliva_assessment_app/nav/routes.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5),()=> Get.toNamed(Routes.login));
   return ColoredBox(color: Colors.blue.shade900,
   child: Center(
     child: Image.asset('assets/images/guliva_logo_1.png'),
   ),);
  }


}