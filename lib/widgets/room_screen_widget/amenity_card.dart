import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class AmenityCard extends StatelessWidget {
  final IconData icon;
  final String title;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  final double height;
  final double width;

  const AmenityCard({
    super.key,
    required this.icon,
    required this.title,

    this.backgroundColor,
    this.iconColor,
    this.textColor,

    this.height = 40,
    this.width = 110,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,

      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lGrey,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor ?? AppColors.textColor, size: 18),

          SizedBox(width: 8),

          Text(
            title,
            style: CustomTextStyles.f16W600(
              color: textColor ?? AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
