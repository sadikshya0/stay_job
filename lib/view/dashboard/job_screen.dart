import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/job_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/widgets/job_screen_widget/job_cards.dart';

class JobScreen extends StatelessWidget {
  JobScreen({super.key});

  final controller = Get.put(JobScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      // APP BAR
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        toolbarHeight: 110,
        elevation: 2,
        shadowColor: AppColors.lGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: Column(
          children: [
            Text(
              "Find Your Career",
              style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 15),

            // FILTER ROW
            Row(
              children: [
                buildFilterButton("All", 0, 55),
                buildFilterButton("Waiter", 1, 70),
                buildFilterButton("Developer", 2, 85),
                buildFilterButton("Driver", 3, 70),
              ],
            ),
          ],
        ),
      ),

      // BODY
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            final index = controller.selectedIndex.value;

            final filtered = controller.job.where((job) {
              final title = job["title"].toString();

              if (index == 0) return true;
              if (index == 1) return title.contains("Waiter");
              if (index == 2) return title.contains("Developer");
              if (index == 3) return title.contains("Driver");

              return true;
            }).toList();

            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final job = filtered[i];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: JobCards(
                    image: ImagePath.job,
                    title: job["title"],
                    company: job["company"],
                    jobType: job["type"],
                    salary: job["salary"],
                    location: job["location"],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

Widget buildFilterButton(String text, int index, double width) {
  final controller = Get.find<JobScreenController>();

  return Obx(() {
    final isSelected = controller.selectedIndex.value == index;

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => controller.changeIndex(index),
      child: Container(
        height: 33,
        width: width,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.lGrey,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.lGrey),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyles.f12W400(
              color: isSelected ? AppColors.whiteColor : AppColors.textColor,
            ),
          ),
        ),
      ),
    );
  });
}
