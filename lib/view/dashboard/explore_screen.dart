import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_job/controller/dashboard/explore_screen_controller.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/widgets/custom/custom_textfield.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final controller = Get.put(ExploreScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Column(
            children: [
              CustomTextField(
                hint: "Search a location....",
                textInputAction: TextInputAction.search,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 15),

              // FILTER ROW
              Row(
                children: [
                  buildFilterButton("Both", 0, 55),
                  buildFilterButton("Jobs", 1, 70),
                  buildFilterButton("Rooms", 2, 85),
                ],
              ),
              SizedBox(height: 20),
              GetBuilder<ExploreScreenController>(
                builder: (_) {
                  return Expanded(
                    child: GoogleMap(
                      onMapCreated: controller.onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: controller.initialPosition,
                        zoom: 14,
                      ),
                      markers: controller.markers,

                      onTap: (position) {
                        controller.addMarker(
                          position,
                          "marker_${position.latitude}",
                        );
                      },

                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildFilterButton(String text, int index, double width) {
  final controller = Get.find<ExploreScreenController>();

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
