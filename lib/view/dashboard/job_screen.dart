import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/job_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/job_detail_screen.dart';
import 'package:safe_job/widgets/job_screen_widget/job_cards.dart';

class JobScreen extends StatelessWidget {
  JobScreen({super.key});

  final controller = Get.put(JobScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        toolbarHeight: 110,
        elevation: 2,
        shadowColor: AppColors.lGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: Column(
          children: [
            Text(
              "Find Your Career",
              style: CustomTextStyles.f18W600(color: AppColors.primaryColor),
            ),
            SizedBox(height: 15),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildFilterButton("All", 0, 55),
                  buildFilterButton("full_time", 1, 70),
                  buildFilterButton("part_time", 2, 85),
                  buildFilterButton("Contract", 3, 70),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            final index = controller.selectedIndex.value;

            final filtered = controller.jobList.where((job) {
              final type = job.jobType;

              switch (index) {
                case 0:
                  return true;
                case 1:
                  return type == "full_time";
                case 2:
                  return type == "part_time";
                case 3:
                  return type == "Contract";
                default:
                  return true;
              }
            }).toList();

            if (filtered.isEmpty) {
              return Center(child: Text("No rooms available"));
            }
            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final job = filtered[i];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: JobCards(
                    image: ImagePath.job,
                    title: job.title ?? "",
                    company: job.companyName ?? "",
                    jobType: job.jobType ?? "",
                    salary: "NPR ${job.salaryMin}- ${job.salaryMax}",
                    location: job.location ?? "",
                    onSeemoreTap: () {
                      Get.to(() => JobDetailScreen(job: job));
                    },
                    onBookmarkTap: () {},
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
