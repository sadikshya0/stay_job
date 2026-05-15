import 'package:flutter/material.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';

class JobCard extends StatelessWidget {
  final String image;
  final String title;
  final String company;
  final String jobType;
  final String experience;
  final String salary;
  final String location;

  const JobCard({
    super.key,
    required this.image,
    required this.title,
    required this.company,
    required this.jobType,
    required this.experience,
    required this.salary,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 240,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.secondaryTextColor.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 4,
            blurRadius: 3,
            color: AppColors.lGrey,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // TOP SECTION
            Row(
              children: [
                Image.asset(image, height: 45, width: 40),
                const SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: CustomTextStyles.f14W600(
                          color: AppColors.textColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        company,
                        style: CustomTextStyles.f14W400(
                          color: AppColors.secondaryTextColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // TAGS
            Row(
              children: [
                Container(
                  height: 20,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      jobType,
                      style: CustomTextStyles.f12W600(color: AppColors.orange),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Container(
                  height: 20,
                  width: 75,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      experience,
                      style: CustomTextStyles.f12W600(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // BOTTOM INFO
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  salary,
                  style: CustomTextStyles.f12W600(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  location,
                  style: CustomTextStyles.f12W400(
                    color: AppColors.secondaryTextColor,
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
