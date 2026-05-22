import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class PaymentCard extends StatelessWidget {
  final String iconPath;
  final String cardNumber;
  final String cardType;

  final Color borderColor;
  final Color iconBorderColor;

  const PaymentCard({
    super.key,
    required this.iconPath,
    required this.cardNumber,
    required this.cardType,
    this.borderColor = AppColors.lGrey,
    required this.iconBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // ICON BOX
          Container(
            height: 35,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: iconBorderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(iconPath, height: 18, width: 18),
            ),
          ),

          const SizedBox(width: 10),

          // DETAILS
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardNumber,
                style: CustomTextStyles.f14W600(color: AppColors.textColor),
              ),
              Text(
                cardType,
                style: CustomTextStyles.f14W400(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
