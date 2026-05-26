import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
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
  const HomeScreen({super.key});

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
                InkWell(
                  onTap: () {
                    Get.offAll(() => NotificationScreen());
                  },
                  child: CircleIconButton(icon: Icons.notifications_none),
                ),
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
                        // TOP RIGHT SVG
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

                        // MAIN CONTENT
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New job near your saved room!",
                              style: CustomTextStyles.f14W600(
                                color: AppColors.whiteColor,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "UI/UX designer role at Random Tech is just 1 km         away from your place.",
                              style: CustomTextStyles.f14W400(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),

                            const SizedBox(height: 15),

                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.whiteColor),
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
                        ),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      JobCard(
                        image: ImagePath.job,
                        title: "Senior Backend..",
                        company: "TechFlow Solution",
                        jobType: "FULL TIME",
                        experience: "+3 YEARS",
                        salary: "NPR 70k - 90k",
                        location: "0 km, Pokhara",
                      ),
                      SizedBox(width: 20),
                      JobCard(
                        image: ImagePath.job,
                        title: "Content Creator",
                        company: "ABC Solution",
                        jobType: "FULL TIME",
                        experience: "+2 YEARS",
                        salary: "NPR 15k - 25k",
                        location: "Srijanachowk, Pokhara",
                      ),
                      SizedBox(width: 20),
                      JobCard(
                        image: ImagePath.job,
                        title: "UI/UX Designer",
                        company: "XYZ Studio",
                        jobType: "FULL TIME",
                        experience: "+2 YEARS",
                        salary: "NPR 20k - 30k",
                        location: "Ratnachowk, Pokhara",
                      ),
                    ],
                  ),
                ),
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
                FlatCard(
                  image: ImagePath.job,
                  title: "Flat",
                  location: "Lamachaur, Pokhara",
                  price: "NPR 15000",
                  rating: "4.5",
                ),
                SizedBox(height: 20),
                FlatCard(
                  image: ImagePath.job,
                  title: "Single Room",
                  location: "Bagar, Pokhara",
                  price: "NPR 5000",
                  rating: "4.5",
                ),
                SizedBox(height: 20),

                FlatCard(
                  image: ImagePath.job,
                  title: "Flat",
                  location: "0km, Pokhara",
                  price: "NPR 5000",
                  rating: "4.5",
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
