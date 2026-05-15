import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class MessageCard extends StatelessWidget {
  final String image;
  final String companyName;
  final String message;
  final String time;
  final bool isRead;
  final double readFontSize;
  final FontWeight readFontWeight;

  MessageCard({
    super.key,
    required this.image,
    required this.companyName,
    required this.message,
    required this.time,
    this.isRead = false,

    this.readFontSize = 11,
    this.readFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // COMPANY IMAGE
        Container(
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lGrey),
            shape: BoxShape.circle,
          ),
          child: Image.asset(image, fit: BoxFit.cover),
        ),

        SizedBox(width: 12),

        // CONTENT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      companyName,
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),

                      SizedBox(width: 4),

                      Text(
                        time,
                        style: CustomTextStyles.f10W300(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      message,
                      style: CustomTextStyles.f12W600(
                        color: AppColors.textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(width: 10),
                  isRead
                      ? Text(
                          "Read",
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Icon(
                          Icons.fiber_manual_record,
                          size: 12,
                          color: AppColors.primaryColor,
                        ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
