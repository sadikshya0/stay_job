import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/room_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/view/dashboard/room_schedule_screen.dart';
import 'package:safe_job/view/dashboard/room_view_screen.dart';
import 'package:safe_job/widgets/room_screen_widget/room_card.dart';

class RoomScreen extends StatelessWidget {
  RoomScreen({super.key});

  final controller = Get.put(RoomScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
              "Pick Your Space",
              style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
            ),
            SizedBox(height: 15),

            // FILTER ROW
            Row(
              children: [
                buildFilterButton("All", 0, 55),
                buildFilterButton("Flat", 1, 60),
                buildFilterButton("Single", 2, 70),
                buildFilterButton("House", 3, 70),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final index = controller.selectedIndex.value;

            final filtered = controller.roomList.where((room) {
              final type = (room.roomType).toLowerCase();

              switch (index) {
                case 0:
                  return true;
                case 1:
                  return type == "apartment";
                case 2:
                  return type == "single";
                case 3:
                  return type == "house";
                default:
                  return true;
              }
            }).toList();

            if (filtered.isEmpty) {
              return const Center(child: Text("No rooms available"));
            }

            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final room = filtered[i];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: RoomCard(
                    image: room.image,
                    title: room.title,
                    price: "Rs. ${room.rentAmount}",
                    location: room.location,
                    onViewTap: () {
                      Get.to(() => RoomViewScreen(room: room));
                    },
                    onBookTap: () {
                      Get.to(RoomScheduleScreen());
                    },
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
  final controller = Get.find<RoomScreenController>();

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
