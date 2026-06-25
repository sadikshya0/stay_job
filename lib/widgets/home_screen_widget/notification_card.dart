import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final VoidCallback? onMarkAsRead;
  final VoidCallback? onDelete;
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? timeColor;
  final Color? markAsReadColor;
  final Widget? trailing;
  final bool showMarkAsRead;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    this.trailing,

    this.titleColor,
    this.descriptionColor,
    this.timeColor,
    this.markAsReadColor,
    this.showMarkAsRead = true,
    this.onMarkAsRead,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
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

            SizedBox(height: 6),

            Text(
              description,
              style: CustomTextStyles.f14W400(
                color: descriptionColor ?? AppColors.whiteColor,
              ),
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: timeColor ?? AppColors.secondaryTextColor,
                      size: 18,
                    ),

                    SizedBox(width: 8),

                    Text(
                      time,
                      style: CustomTextStyles.f12W400(
                        color: timeColor ?? AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),

                if (showMarkAsRead)
                  InkWell(
                    onTap: onMarkAsRead,
                    child: Text(
                      "Mark as read",
                      style: CustomTextStyles.f12W400(
                        color: markAsReadColor ?? AppColors.whiteColor,
                      ),
                    ),
                  ),
                InkWell(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete_outline,
                    color: AppColors.secondaryTextColor,
                    size: 20,
                  ),
                ),
                if (trailing != null) ...[SizedBox(height: 6), trailing!],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
