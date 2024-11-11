import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guliva_assessment_app/core/enums/textfield_type.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Function? suffixIconFunc;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? suffixFunc;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextFieldType? type;
  final TextCapitalization textCapitalization;
  final bool validate;
  final Function? validator;
  final EdgeInsets? contentPadding;
  final bool showError;
  final bool? obscure;

  const CustomTextField({
    super.key,
    this.label,
    this.initialValue,
    this.style,
    this.hintText,
    this.hintStyle,
    this.suffixIconFunc,
    this.controller,
    this.inputType,
    this.onChanged,
    this.suffixFunc,
    this.obscure,
    this.enabled = true,
    this.inputFormatters,
    this.type = TextFieldType.others,
    this.validate = true,
    this.validator,
    this.contentPadding,
    this.showError = true,
    this.textCapitalization = TextCapitalization.words,
  });

  @override
  Widget build(BuildContext context) {
    final validEmail = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label == null)
          const SizedBox()
        else
          Container(
            margin: EdgeInsets.only(bottom: 5.h, left: 1.h),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        TextFormField(
          initialValue: initialValue,
          textCapitalization: textCapitalization,
          validator: (val) {
            if (val == null) return 'Invalid input';
            if (type == TextFieldType.email) {
              final bool isValidEmail = val.contains(validEmail);
              return isValidEmail
                  ? null
                  : "Please provide a valid email address";
            } else {
              validator!(val);
            } return null;
          },
          inputFormatters: getFormartter(),
          enableInteractiveSelection: true,
          enabled: enabled,
          controller: controller,
          obscureText: obscure == null ? false : obscure!,
          style: style ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.start,
          keyboardType: inputType ?? TextInputType.text,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          decoration: InputDecoration(
            isCollapsed: true,
            isDense: false,
            hintText: hintText ?? '',
            hintStyle: hintStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
            errorStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
              borderSide: BorderSide(
                color: Colors.blue.shade900,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            contentPadding:
                contentPadding ?? EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            suffixIconConstraints: BoxConstraints(
              minHeight: type == TextFieldType.password ||
                      type == TextFieldType.setPassword
                  ? 10.h
                  : 0,
              minWidth: type == TextFieldType.password ||
                      type == TextFieldType.setPassword
                  ? 80.w
                  : 0,
            ),
            suffixIcon: setPasswordIcon(
              obscuredText: obscure,
              obscurePassword: suffixFunc,
            ),
          ),
        ),
      ],
    );
  }

  Widget? setPasswordIcon({
    required bool? obscuredText,
    required VoidCallback? obscurePassword,
  }) {
    if (type == TextFieldType.password || type == TextFieldType.setPassword) {
      return obscuredText == null
          ? /*IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(
                Icons.error_outline_sharp,
                color: Colors.red,
              ),
              onPressed: obscurePassword,
              iconSize: 20.h,
            )*/
          const SizedBox()
          : GestureDetector(
              onTap: obscurePassword,
              child: obscuredText == true
                  ? const Icon(Icons.remove_red_eye_outlined)
                  : const Icon(Icons.remove_circle_outline));
    }
  }

  List<TextInputFormatter>? getFormartter() {
    if (type == TextFieldType.phone) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ];
    } else if (type == TextFieldType.name) {
      return [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z-]"))];
    }
    return inputFormatters;
  }
}
