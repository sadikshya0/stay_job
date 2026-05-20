import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class TimeSlotCard extends StatelessWidget {
  final String time;
  final double height;
  final double width;

  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const TimeSlotCard({
    super.key,
    required this.time,
    this.height = 50,
    this.width = 180,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.whiteColor,
        border: Border.all(color: borderColor ?? AppColors.lGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          time,
          style: CustomTextStyles.f12W700(
            color: textColor ?? AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
