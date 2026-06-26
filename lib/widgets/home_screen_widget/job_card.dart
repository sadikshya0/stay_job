import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/model/job.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/job_detail_screen.dart';

class JobCard extends StatelessWidget {
  final String image;
  final Job job;
  JobCard({super.key, required this.image, required this.job});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => JobDetailScreen(job: job));
      },
      child: Container(
        height: 150,
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
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(image, height: 45, width: 40),
                  SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title ?? "",
                          style: CustomTextStyles.f14W600(
                            color: AppColors.textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          job.companyName ?? "",
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

              SizedBox(height: 10),

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
                        job.jobType ?? "",
                        style: CustomTextStyles.f12W600(
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 85,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        job.experienceRequired ?? "",
                        style: CustomTextStyles.f12W600(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "NPR ${job.salaryMin}- ${job.salaryMax}",
                style: CustomTextStyles.f12W600(color: AppColors.primaryColor),
              ),
              SizedBox(height: 8),
              Text(
                job.location ?? "",
                style: CustomTextStyles.f12W400(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
