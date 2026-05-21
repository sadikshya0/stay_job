import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class VisitCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String time;
  final String status;

  const VisitCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  Color _bgColor() {
    switch (status.toLowerCase()) {
      case "confirmed":
        return Colors.green.withOpacity(0.2);
      case "rejected":
        return Colors.red.withOpacity(0.2);
      default:
        return Colors.amberAccent.withOpacity(0.3); // pending
    }
  }

  Color _textColor() {
    switch (status.toLowerCase()) {
      case "confirmed":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      default:
        return AppColors.orange; // pending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.lGrey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 80,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.f14W600(color: AppColors.textColor),
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 14,
                        color: AppColors.secondaryTextColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: CustomTextStyles.f12W600(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.secondaryTextColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: CustomTextStyles.f12W600(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),

                  // STATUS
                  Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                      color: _bgColor(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        status.toUpperCase(),
                        style: CustomTextStyles.f12W600(color: _textColor()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
