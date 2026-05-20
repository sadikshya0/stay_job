import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class AmenityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  final double? height;
  final double width;

  final bool isColumn;

  const AmenityCard({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.height,
    this.width = 110,
    this.isColumn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? (isColumn ? 85 : 40),
      width: width,
      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lGrey,
        borderRadius: BorderRadius.circular(15),
      ),

      child: isColumn ? _buildColumn() : _buildRow(),
    );
  }

  Widget _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor ?? AppColors.textColor, size: 18),

        const SizedBox(width: 8),

        Text(
          title,
          style: CustomTextStyles.f14W600(
            color: textColor ?? AppColors.textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor ?? AppColors.textColor, size: 18),

        const SizedBox(height: 4),

        Text(
          title,
          textAlign: TextAlign.center,
          style: CustomTextStyles.f14W600(
            color: textColor ?? AppColors.textColor,
          ),
        ),

        if (description != null) ...[
          const SizedBox(height: 2),

          Text(
            description!,
            textAlign: TextAlign.center,
            style: CustomTextStyles.f10W400(
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ],
    );
  }
}
