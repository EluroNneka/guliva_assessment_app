import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guliva_assessment_app/nav/routes.dart';
import 'package:guliva_assessment_app/ui/views/login/login_controller.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_button.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_button2.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white70,
            toolbarHeight: 100.h,
            title: Image.asset('assets/images/guliva_header.png'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    'LOG IN WITH...',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton2(
                          title: 'GOOGLE',
                          onTapped: () {},
                          image: Icons.g_mobiledata_rounded),

                      CustomButton2(
                          title: 'FACEBOOK',
                          onTapped: () {},
                          image: Icons.facebook),
                    ],
                  ),

                  SizedBox(height: 24.h,),
                  Text(
                    'LOG IN WITH EMAIL',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: "Email address",
                    onChanged: (v) {
                      controller.setEmail(v);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: "Password",
                    obscure: controller.getObscured(),
                    suffixFunc: () {
                      controller.setObscured();
                    },
                    onChanged: (v) {
                      controller.setPassword(v);
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomButton(title: 'LOG IN', onTapped: () {
                    controller.loginUser();
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  const Icon(
                    Icons.fingerprint_rounded,
                    size: 70,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const Text('Touch / Face ID'),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account? '),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.register);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepOrange,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
    });
  }
}
