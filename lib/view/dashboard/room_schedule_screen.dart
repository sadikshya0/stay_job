import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:safe_job/controller/dashboard/room_schedule_controller.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/utils/colors.dart';
import 'package:safe_job/utils/custom_text_styles.dart';
import 'package:safe_job/utils/image_path.dart';
import 'package:safe_job/widgets/room_screen_widget/time_slot_card.dart';

class RoomScheduleScreen extends StatelessWidget {
  final RoomScheduleController controller = Get.put(RoomScheduleController());
  final Room room;

  RoomScheduleScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 4,
        shadowColor: AppColors.lGrey,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Schedule Visit",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.lGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            room.image ?? "",
                            height: 70,
                            width: 90,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Image.asset(
                                ImagePath.bedroom,
                                height: 70,
                                width: 90,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room.title ?? "",
                              style: CustomTextStyles.f16W600(
                                color: AppColors.textColor,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.primaryColor,
                                  size: 16,
                                ),
                                Text(
                                  room.location ?? "",
                                  style: CustomTextStyles.f12W600(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "NPR ${room.rentAmount}/month",
                              style: CustomTextStyles.f16W600(
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Available Slots",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: room.availabilitySlots?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (context, index) {
                    final slot = room.availabilitySlots![index];

                    return Obx(
                      () => TimeSlotCard(
                        availabilitySlots: slot,
                        isSelected:
                            controller.selectedTime.value == slot.startTime,
                        onTap: slot.isBooked == true
                            ? () {}
                            : () {
                                controller.selectTime(
                                  time: slot.startTime ?? "",
                                  slotId: slot.id ?? "",
                                  date: DateTime.parse(
                                    slot.availableDate ?? "",
                                  ),
                                );
                              },
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Note to the owner (optional)",
                  style: CustomTextStyles.f16W600(color: AppColors.textColor),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.notesController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        "Tell a bit about yourself or ask any question...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.lGrey),
                    ),
                    filled: false,
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    controller.bookRoom(roomId: room.id.toString(), room: room);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Obx(() {
                        return controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Confirm Visit Schedule",
                                style: CustomTextStyles.f16W600(
                                  color: AppColors.whiteColor,
                                ),
                              );
                      }),
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
