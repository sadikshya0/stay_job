import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/room_photo_screen.dart';
import 'package:safe_job/view/dashboard/room_schedule_screen.dart';
import 'package:safe_job/widgets/room_screen_widget/amenity_card.dart';
import 'package:safe_job/widgets/room_screen_widget/room_card.dart';

class RoomViewScreen extends StatelessWidget {
  final Room room;
  RoomViewScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE HEADER
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      room.image,
                      height: 270,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 12,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    right: 12,
                    child: Icon(
                      Icons.layers_outlined,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 12,
                    child: InkWell(
                      onTap: () => Get.to(() => RoomPhotoScreen()),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "View all photos",
                          style: CustomTextStyles.f12W600(
                            color: AppColors.textColor,
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
                  Expanded(
                    child: Text(
                      room.title,
                      style: CustomTextStyles.f20W600(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  Icon(Icons.bookmark_outline),
                ],
              ),

              SizedBox(height: 10),

              // LOCATION + DATE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),

                      SizedBox(width: 5),
                      Text(
                        room.location,
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
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        (room.createdAt).toString(),
                        style: CustomTextStyles.f12W400(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10),

              Text(
                "NPR ${room.rentAmount}/month",
                style: CustomTextStyles.f20W600(color: AppColors.green),
              ),

              SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lGrey,
                          child: Text("J"),
                        ),
                        SizedBox(width: 10),
                        Column(
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
                        Icon(Icons.chat, color: Colors.amber),
                        SizedBox(width: 15),
                        Icon(Icons.phone, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // AMENITIES
              Text(
                "Amenities",
                style: CustomTextStyles.f16W600(color: AppColors.textColor),
              ),
              SizedBox(height: 10),

              Column(
                children: [
                  Row(
                    children: [
                      AmenityCard(icon: Icons.wifi, title: "WiFi"),
                      SizedBox(width: 4),
                      AmenityCard(icon: Icons.ac_unit, title: "AC"),
                      SizedBox(width: 4),
                      AmenityCard(icon: Icons.kitchen, title: "Kitchen"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      AmenityCard(icon: Icons.door_front_door, title: "Rooms"),
                      SizedBox(width: 4),
                      AmenityCard(icon: Icons.car_rental, title: "Parking"),
                      SizedBox(width: 4),
                      AmenityCard(icon: Icons.bathtub, title: "Bathroom"),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 25),

              Text(
                "About",
                style: CustomTextStyles.f16W600(color: AppColors.textColor),
              ),

              SizedBox(height: 10),

              Text(
                room.description,
                textAlign: TextAlign.justify,
                style: CustomTextStyles.f12W400(color: AppColors.textColor),
              ),

              SizedBox(height: 25),

              Text(
                "Similar Recommendation",
                style: CustomTextStyles.f16W600(color: AppColors.textColor),
              ),

              SizedBox(height: 15),

              // ROOM CARD FIXED
              RoomCard(
                image: room.image,
                title: room.title,
                price: "Rs. ${room.rentAmount}",
                location: room.location,
                isBookAvailable: false,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: InkWell(
          onTap: () => Get.to(() => RoomScheduleScreen()),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Book visit now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
