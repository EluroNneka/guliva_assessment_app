import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guliva_assessment_app/core/enums/textfield_type.dart';
import 'package:guliva_assessment_app/nav/routes.dart';
import 'package:guliva_assessment_app/ui/views/register/register_controller.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_button.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_button2.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_date_picker.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_textfield.dart';

class RegisterView extends StatefulWidget {

  GlobalKey<FormState> fKey = GlobalKey<FormState>();

   RegisterView({super.key});

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
              child: Form(
                key: widget.fKey,
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
                      height: 30.h,
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
                      type: TextFieldType.name,
                      onChanged: (v) {
                        controller.setFirstName(v);
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      label: "Last Name",
                      type: TextFieldType.name,
                      onChanged: (v) {
                        controller.setLastName(v);
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      label: "Phone Number",
                      type: TextFieldType.phone,
                      onChanged: (v) {
                        controller.setPhone(v);
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      label: "Email address",
                      type: TextFieldType.email,
                      onChanged: (v) {
                        controller.setEmail(v);
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomDatePicker(
                        label: "Date of Birth",
                        placeholder: '',
                        onDateSelected: (date) {
                          controller.setDob(date);
                        }),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      label: "Password",
                      type: TextFieldType.setPassword,
                      obscure: controller.getObscured(),
                      suffixFunc: () {
                        controller.setObscured();
                      },
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
                      width: 390.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                              fillColor:
                                  WidgetStateProperty.resolveWith((Set states) {
                                return Colors.blue.shade900;
                              }),
                              activeColor: Colors.blue.shade900,
                              value: controller.acceptTerms,
                              onChanged: (v) {
                                controller.setAcceptTerms();
                              }),
                          Flexible(
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                text: 'I agree to the ',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black),
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
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black),
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
                        disable: controller.loading,
                        onTapped: () {
                          if(widget.fKey.currentState!.validate()) {
                            widget.fKey.currentState?.save();
                            controller.registerUser(context);
                          }
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
            ),
          ));
    });
  }
}
