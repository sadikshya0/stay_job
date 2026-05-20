import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class DayDateCard extends StatelessWidget {
  final String day;
  final String date;

  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double width;

  const DayDateCard({
    super.key,
    required this.day,
    required this.date,
    this.backgroundColor,
    this.textColor,
    this.height = 60,
    this.width = 45,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lGrey,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: CustomTextStyles.f12W400(
              color: textColor ?? AppColors.textColor,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            date,
            style: CustomTextStyles.f12W600(
              color: textColor ?? AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
