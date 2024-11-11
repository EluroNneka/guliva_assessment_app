import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTapped;
  final bool disable;
  final Color? color;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTapped,
    this.color,
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
          height: 48.h,
          decoration: BoxDecoration(
            color: color == null
                ? Colors.blue.shade900 //Color(0xffEBEBEB)
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
              Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontSize: 16,
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
