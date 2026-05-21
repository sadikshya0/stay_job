import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class ProfileCard extends StatelessWidget {
  final IconData leadingIcon;
  final String title;

  final VoidCallback? onTap;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;

  final double height;

  const ProfileCard({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
    this.backgroundColor,
    required this.iconColor,
    this.textColor,
    this.borderColor,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,

      child: Container(
        height: height,
        width: double.infinity,

        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.whiteColor,

          borderRadius: BorderRadius.circular(15),

          border: Border.all(color: borderColor ?? AppColors.lGrey),

          boxShadow: [
            BoxShadow(
              color: AppColors.lGrey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Icon(
                    leadingIcon,
                    color: iconColor ?? AppColors.primaryColor,
                    size: 20,
                  ),

                  const SizedBox(width: 10),

                  Text(
                    title,
                    style: CustomTextStyles.f14W600(
                      color: textColor ?? AppColors.textColor,
                    ),
                  ),
                ],
              ),

              Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.secondaryTextColor,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
