import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/room_photo_screen.dart';
import 'package:safe_job/view/dashboard/room_schedule_screen.dart';
import 'package:safe_job/widgets/room_screen_widget/amenity_card.dart';

class RoomViewScreen extends StatelessWidget {
  const RoomViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      ImagePath.flat,
                      height: 270,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 30,
                      left: 8,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      right: 8,
                      child: Icon(
                        Icons.layers_outlined,
                        color: AppColors.textColor.withOpacity(0.5),
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      right: 8,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => RoomPhotoScreen());
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber,
                          ),
                          child: Center(
                            child: Text(
                              "View all photos",
                              style: CustomTextStyles.f12W600(
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Modern 2BHK Flat",
                      style: CustomTextStyles.f20W600(
                        color: AppColors.textColor,
                      ),
                    ),
                    Icon(
                      Icons.bookmark_outline,
                      color: AppColors.orange.withOpacity(0.5),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    Text(
                      "Masbar-7, Pokhara",
                      style: CustomTextStyles.f14W600(
                        color: AppColors.textColor,
                      ),
                    ),
                    SizedBox(width: 85),
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),

                    Text(
                      "Expires: 3/29/2026",
                      style: CustomTextStyles.f14W600(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Text(
                  "NPR 18K/month",
                  style: CustomTextStyles.f20W600(
                    color: AppColors.green.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 65,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lGrey,
                            ),
                            child: Text(
                              "J",
                              style: CustomTextStyles.f28W600(
                                color: AppColors.secondaryTextColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "John Doe",
                                style: CustomTextStyles.f12W600(
                                  color: AppColors.whiteColor,
                                ),
                              ),

                              Text(
                                "Property owner",
                                style: CustomTextStyles.f12W400(
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.messenger_outline_outlined,
                            color: Colors.amberAccent.withOpacity(0.9),
                            size: 20,
                          ),

                          SizedBox(width: 20),

                          Icon(
                            Icons.phone,
                            color: AppColors.green.withOpacity(0.9),
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Location",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Positioned(
                      top: 35,
                      right: 170,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 28,
                      ),
                    ),
                    Image.asset(ImagePath.map),
                  ],
                ),
                SizedBox(height: 30),

                Text(
                  "Amenities",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AmenityCard(icon: Icons.wifi, title: "wifi"),
                    AmenityCard(icon: Icons.ac_unit_sharp, title: "AC"),
                    AmenityCard(icon: Icons.kitchen, title: "Kitchen"),
                  ],
                ),
                SizedBox(height: 30),

                InkWell(
                  onTap: () {
                    Get.to(() => RoomScheduleScreen());
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.lGrey,
                        ),
                        Text(
                          "Book visit now",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
