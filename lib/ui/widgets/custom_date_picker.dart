import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guliva_assessment_app/core/utils/date_formatter.dart';

class CustomDatePicker extends StatefulWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final DateTime? stopDate;
  final DateTime? startDate;
  final DateTime? initialDate;
  final ValueChanged<String> onDateSelected;
  final bool enabled;
  final bool? greyLabelStyle;

  const CustomDatePicker({
    super.key,
    this.label,
    this.value,
    this.placeholder,
    this.stopDate,
    this.startDate,
    this.initialDate,
    required this.onDateSelected,
    this.enabled = true,
    this.greyLabelStyle = false,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String date = '';
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();

    if (widget.value != null) {
      date = widget.value!;
    }
    if (widget.initialDate != null) {
      dateTime = widget.initialDate!;
    } else {
      dateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );
    }
  }

  Future showPicker(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: widget.startDate ?? DateTime(1800),
          lastDate: widget.stopDate ?? DateTime(2050),
        ).then((value) {
          if (value != null) {
            setState(() {
              date = DateFormatter.yyyymmdd.format(value);
              dateTime = value;
              widget.onDateSelected(date);
            });
          }
        });
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: 300.h,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  setState(() {
                    date = DateFormatter.yyyymmdd.format(value);
                    dateTime = value;
                    widget.onDateSelected(date);
                  });
                },
                backgroundColor: Colors.blue.shade900,
                initialDateTime: dateTime,
                minimumYear: widget.startDate?.year ?? DateTime(1800).year,
                maximumYear: widget.stopDate?.year ?? DateTime(2050).year,
                minimumDate: widget.startDate ?? DateTime(1800),
                maximumDate: widget.stopDate ?? DateTime(2050),
              ),
            );
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label == null)
          const SizedBox()
        else
          Container(
            margin: EdgeInsets.only(bottom: 5.w),
            child: Text(
              widget.label!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ),
        SizedBox(
          height: 54.h,
          child: InkWell(
            onTap:
                widget.enabled ? () async => await showPicker(context) : () {},
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 30.w, 12.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      date.isNotEmpty ? date : '${widget.placeholder}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16.w,
                    color: const Color(0xff152230),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
