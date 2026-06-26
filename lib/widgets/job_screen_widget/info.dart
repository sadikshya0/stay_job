import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class Info extends StatelessWidget {
  final String title;
  final String description;
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;

  const Info({
    super.key,
    required this.title,
    required this.description,
    this.iconColor = Colors.amber,
    this.backgroundColor = const Color(0xFFFFD54F),
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor.withOpacity(0.3),
          ),
          child: Center(child: Icon(icon, color: iconColor, size: 26)),
        ),

        const SizedBox(width: 8),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyles.f12W600(
                color: AppColors.secondaryTextColor,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.left,
              style: CustomTextStyles.f14W600(color: AppColors.textColor),
            ),
          ],
        ),
      ],
    );
  }
}
