import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton2 extends StatelessWidget {
  final String title;
  final Function onTapped;
  final bool disable;
  final IconData image;
  final Color? color;

  const CustomButton2({
    super.key,
    required this.title,
    required this.onTapped,
    this.color,
    required this.image,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disable) {
          HapticFeedback.heavyImpact();
          onTapped();
        }
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Opacity(
        opacity: 1,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          height: 54.h,
          width: 170.w,
          decoration: BoxDecoration(
            color: color == null
                ? Colors.white //Color(0xffEBEBEB)
                : disable == true
                    ? Colors.grey.shade800
                    : Colors.blue.shade900,
            border: Border.all(
              color: Colors.blue.shade900,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                image,
                color: Colors.blue.shade900,
                size: 24,
              ),
              SizedBox(
                width: 24.w,
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.blue.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
