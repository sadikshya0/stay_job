import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/controller/dashboard/room_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
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
            final index = controller.selectedIndex.value;

            final filtered = controller.room.where((room) {
              final title = room["title"].toString();

              if (index == 0) return true;
              if (index == 1) return title.contains("Flat");
              if (index == 2) return title.contains("Single");
              if (index == 3) return title.contains("House");

              return true;
            }).toList();

            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final room = filtered[i];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: RoomCard(
                    image: ImagePath.flat,
                    title: room["title"],
                    price: room["price"],
                    location: room["location"],
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
