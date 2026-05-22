import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? iconColor;
  final Color? titleColor;
  final Color? descriptionColor;

  final double height;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.iconColor,
    this.titleColor,
    this.descriptionColor,
    this.height = 130,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,

      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.whiteColor,

        border: Border.all(color: borderColor ?? AppColors.lGrey),

        borderRadius: BorderRadius.circular(15),

        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors.lGrey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1.5),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor ?? AppColors.primaryColor,
                  size: 16,
                ),

                const SizedBox(width: 5),

                Text(
                  title,
                  style: CustomTextStyles.f12W600(
                    color: titleColor ?? AppColors.textColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: CustomTextStyles.f12W400(
                color: descriptionColor ?? AppColors.textColor,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
