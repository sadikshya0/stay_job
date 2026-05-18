import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/job_detail_screen.dart';
import 'package:safe_job/view/dashboard/job_screen.dart';

class JobCards extends StatelessWidget {
  final String image;
  final String title;
  final String company;
  final String jobType;
  final String salary;
  final String location;

  const JobCards({
    super.key,
    required this.image,
    required this.title,
    required this.company,
    required this.jobType,
    required this.salary,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
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
                Image.asset(image, height: 60, width: 60),
                const SizedBox(width: 8),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: CustomTextStyles.f16W600(
                              color: AppColors.textColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(Icons.bookmark_border, size: 18),
                        ],
                      ),
                      Text(
                        company,
                        style: CustomTextStyles.f16W400(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primaryColor,
                          size: 14,
                        ),
                        Text(
                          location,
                          style: CustomTextStyles.f14W600(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_sharp,
                          color: AppColors.orange,
                          size: 16,
                        ),
                        Text(
                          jobType,
                          style: CustomTextStyles.f14W600(
                            color: AppColors.orange,
                          ),
                        ),
                      ],
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
                  style: CustomTextStyles.f16W600(
                    color: AppColors.primaryColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => JobDetailScreen());
                  },
                  child: Container(
                    height: 25,
                    width: 75,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "See more",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.whiteColor,
                        ),
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
