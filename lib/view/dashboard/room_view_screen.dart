import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/view/dashboard/room_photo_screen.dart';
import 'package:safe_job/view/dashboard/room_schedule_screen.dart';
import 'package:safe_job/widgets/room_screen_widget/amenity_card.dart';
import 'package:safe_job/widgets/room_screen_widget/room_card.dart';

class RoomViewScreen extends StatelessWidget {
  const RoomViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        ImagePath.flat,
                        height: 270,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // BACK BUTTON
                    Positioned(
                      top: 20,
                      left: 12,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // LAYERS ICON
                    Positioned(
                      top: 20,
                      right: 12,
                      child: Icon(
                        Icons.layers_outlined,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),

                    // VIEW ALL PHOTOS BUTTON
                    Positioned(
                      bottom: 10,
                      right: 12,
                      child: InkWell(
                        onTap: () => Get.to(() => const RoomPhotoScreen()),
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                SizedBox(height: 20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),

                        Text(
                          "Expires: 3/29/2026",
                          style: CustomTextStyles.f14W600(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AmenityCard(
                      icon: Icons.wifi,
                      title: "wifi",
                      isColumn: false,
                    ),
                    SizedBox(width: 8),

                    AmenityCard(
                      icon: Icons.ac_unit_sharp,
                      title: "AC",
                      isColumn: false,
                    ),
                    SizedBox(width: 8),

                    AmenityCard(
                      icon: Icons.kitchen,
                      title: "Kitchen",
                      isColumn: false,
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AmenityCard(
                      icon: Icons.door_front_door_outlined,
                      title: "Rooms",
                      description: "2",
                      isColumn: true,
                    ),
                    SizedBox(width: 8),
                    AmenityCard(
                      icon: Icons.car_rental_outlined,
                      title: "Parking",
                      description: "Available",
                      isColumn: true,
                    ),
                    SizedBox(width: 8),

                    AmenityCard(
                      icon: Icons.bathtub_outlined,
                      title: "bathroom",
                      description: "2",
                      isColumn: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "About",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.justify,
                  "Lorem ipsum dolor sit amet consectetur. Amet lacus duis augue nisi pharetra. Egestas facilisis aliquam vulputate id sed. Velit faucibus adipiscing proin accumsan quis mi lectus quam euismod. Mattis curabitur diam mattis phasellus nullam. Nec sed malesuada dui cursus diam mattis diam. Facilisis sed nulla quisque quam id bibendum ut lectus elementum. Sit tellus lorem odio morbi.",
                  style: CustomTextStyles.f12W400(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                Text(
                  "Similar Recommendation",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                RoomCard(
                  image: ImagePath.bedroom,
                  title: "Modern Loft Downtown",
                  price: "NPR 18K/month",
                  location: "Masbar-7, Pokhara",
                  isBookAvailable: false,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.to(() => RoomScheduleScreen());
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
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
                Icon(Icons.calendar_month_outlined, color: AppColors.lGrey),
                Text(
                  "Book visit now",
                  style: CustomTextStyles.f16W600(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
