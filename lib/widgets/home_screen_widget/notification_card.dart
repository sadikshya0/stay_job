import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final Color containerColor;

  // Optional colors
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? timeColor;
  final Color? markAsReadColor;

  // Optional mark as read
  final bool showMarkAsRead;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.containerColor,

    this.titleColor,
    this.descriptionColor,
    this.timeColor,
    this.markAsReadColor,
    this.showMarkAsRead = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lGrey),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE
            Text(
              title,
              style: CustomTextStyles.f16W600(
                color: titleColor ?? AppColors.whiteColor,
              ),
            ),

            const SizedBox(height: 6),

            // DESCRIPTION
            Text(
              description,
              style: CustomTextStyles.f14W400(
                color: descriptionColor ?? AppColors.whiteColor,
              ),
            ),

            const Spacer(),

            // BOTTOM ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: timeColor ?? AppColors.secondaryTextColor,
                      size: 18,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      time,
                      style: CustomTextStyles.f12W400(
                        color: timeColor ?? AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),

                // OPTIONAL MARK AS READ
                if (showMarkAsRead)
                  Text(
                    "Mark as read",
                    style: CustomTextStyles.f12W400(
                      color: markAsReadColor ?? AppColors.whiteColor,
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
