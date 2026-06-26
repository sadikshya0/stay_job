import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/job_screen_controller.dart';
import 'package:safe_job/controller/dashboard/notification_controller.dart';
import 'package:safe_job/controller/dashboard/room_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/message_screen.dart';
import 'package:safe_job/view/dashboard/notification_screen.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';
import 'package:safe_job/widgets/home_screen_widget/circle_icon_button.dart';
import 'package:safe_job/widgets/home_screen_widget/flat_card.dart';
import 'package:safe_job/widgets/home_screen_widget/job_card.dart';

class HomeScreen extends StatelessWidget {
  final JobScreenController controller = Get.put(JobScreenController());
  final RoomScreenController c = Get.put(RoomScreenController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back,",
                  style: CustomTextStyles.f12W600(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Text(
                  "Jeremiah Gislason",
                  style: CustomTextStyles.f18W600(color: AppColors.textColor),
                ),
              ],
            ),

            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(() => MessageScreen());
                  },
                  child: CircleIconButton(icon: Icons.messenger_outline),
                ),
                SizedBox(width: 10),
                Obx(() {
                  final controller = Get.put(NotificationController());

                  return InkWell(
                    onTap: () {
                      Get.to(() => NotificationScreen());
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                            border: Border.all(
                              color: AppColors.lGrey,
                              width: 1,
                            ),
                          ),
                          child: CircleIconButton(
                            icon: Icons.notifications_outlined,
                          ),
                        ),

                        if (controller.unreadCount > 0)
                          Positioned(
                            right: -2,
                            top: -2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                controller.unreadCount.toString(),
                                style: CustomTextStyles.f10W600(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hint: "Search rooms or jobs....",
                  textInputAction: TextInputAction.search,
                  textInputType: TextInputType.text,
                  preIconPath: Icons.search,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Smart Sync Suggestions",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "AI POWERED",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 4,
                        blurRadius: 4,
                        color: AppColors.lGrey,
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        Color.fromARGB(255, 56, 54, 72),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -1,
                          right: -2,
                          child: SvgPicture.asset(
                            ImagePath.polygon,
                            height: 50,
                            width: 50,
                          ),
                        ),

                        // BOTTOM RIGHT SVG
                        Positioned(
                          bottom: 4,
                          right: 8,
                          child: Transform.rotate(
                            angle: 1.2, // 180 degree rotation
                            child: SvgPicture.asset(
                              ImagePath.polygon,
                              height: 50,
                              width: 50,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),

                        Obx(() {
                          if (controller.jobList.isEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No jobs available",
                                  style: CustomTextStyles.f14W600(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Check back later for new opportunities.",
                                  style: CustomTextStyles.f14W400(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            );
                          }

                          final job = controller.jobList.first;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${job.title} at ${job.companyName}",
                                style: CustomTextStyles.f14W600(
                                  color: AppColors.whiteColor,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "${job.location} ",
                                style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                              SizedBox(height: 5),

                              Text(
                                " NPR ${job.salaryMin}-${job.salaryMax}",
                                style: CustomTextStyles.f14W400(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),

                              SizedBox(height: 15),

                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "View Match",
                                    style: CustomTextStyles.f12W600(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Jobs",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      // onTap: () {
                      //   Get.offAll(() => JobScreen());
                      // },
                      child: Text(
                        "See All",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (controller.jobList.isEmpty) {
                    return Center(child: Text("No jobs found"));
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.jobList.map((job) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: JobCard(image: ImagePath.job, job: job),
                        );
                      }).toList(),
                    ),
                  );
                }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Rooms",
                      style: CustomTextStyles.f16W600(
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "See All",
                        style: CustomTextStyles.f14W600(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Obx(() {
                  if (c.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (c.roomList.isEmpty) {
                    return Center(child: Text("No jobs found"));
                  }

                  return Column(
                    children: c.roomList.map((room) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FlatCard(room: room),
                      );
                    }).toList(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
