import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class PaymentHistoryCard extends StatelessWidget {
  final String date;
  final String title;
  final String amount;

  final VoidCallback? onDownloadTap;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? buttonColor;

  const PaymentHistoryCard({
    super.key,
    required this.date,
    required this.title,
    required this.amount,
    this.onDownloadTap,
    this.backgroundColor,
    this.borderColor,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,

      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lGrey,
        border: Border.all(
          color: borderColor ?? AppColors.secondaryTextColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            // LEFT SIDE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  date,
                  style: CustomTextStyles.f12W600(color: AppColors.textColor),
                ),

                const SizedBox(height: 4),

                Text(
                  title,
                  style: CustomTextStyles.f12W400(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),

            // RIGHT SIDE
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  amount,
                  style: CustomTextStyles.f12W600(color: AppColors.textColor),
                ),

                const SizedBox(height: 5),

                InkWell(
                  onTap: onDownloadTap,
                  borderRadius: BorderRadius.circular(15),

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 4,
                    ),

                    decoration: BoxDecoration(
                      color: buttonColor ?? AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Text(
                      "Download PDF",
                      style: CustomTextStyles.f10W600(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
