import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guliva_assessment_app/ui/widgets/custom_button.dart';

class LoginView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Image.asset('assets/images/guliva_header.png'),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white70,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Log In',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold

                  ),),
                  SizedBox(height: 35.h,),
                  Text('LOG IN WITH...',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      color: Colors.black87

                    ),),SizedBox(height: 16.h,),
                  Row(
                    children: [],
                  ),

                  Text('LOG IN WITH EMAIL',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,

                    ),),SizedBox(height: 16.h,),
                  CustomTextField(),
                  SizedBox(height: 16.h,),
                  
                  SizedBox(height: 8.h,),
                  Text('Forgot Password?',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.deepOrange,
                  ) ,),

                  SizedBox(height: 24.h,),

                  CustomButton(title: 'LOG IN', onTapped: (){}),
                  SizedBox(height: 24,),






                ],

              ),
            ),
          )
        );
      }
    )
  }

}