import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guliva_assessment_app/nav/routes.dart';
import 'package:guliva_assessment_app/ui/views/register/register_controller.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_button.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_button2.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
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
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    'SIGN UP WITH...',
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
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'SIGN UP WITH EMAIL',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: "First Name",
                    onChanged: (v) {
                      controller.setFirstName(v);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: "Last Name",
                    onChanged: (v) {
                      controller.setLastName(v);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: "Phone Number",
                    onChanged: (v) {
                      controller.setPhone(v);
                    },
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
                    label: "Date of Birth",
                    onChanged: (v) {
                      controller.setDob(v);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: "Password",
                    onChanged: (v) {
                      controller.setPassword(v);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    width: 350.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: false, onChanged: (v) {}),
                        Flexible(
                          child: RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                            TextSpan(
                              text: 'Terms & Conditions ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.deepOrange,
                              ),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ])),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomButton(
                      title: 'SIGN UP',
                      onTapped: () {
                        controller.registerUser();
                      }),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.login);
                        },
                        child: const Text(
                          'Log In',
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
