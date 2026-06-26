import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/repo/book_room_repo.dart';
import 'package:safe_job/utils/custom_snackbar.dart';
import 'package:safe_job/view/dashboard/room_appointment_screen.dart';

class RoomScheduleController extends GetxController {
  RxString selectedTime = "".obs;
  RxString selectedSlotId = "".obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxBool isLoading = false.obs;

  final TextEditingController notesController = TextEditingController();

  void selectTime({
    required String time,
    required String slotId,
    required DateTime date,
  }) {
    selectedTime.value = time;
    selectedSlotId.value = slotId;
    selectedDate.value = date;
  }

  Future<void> bookRoom({required String roomId, required Room room}) async {
    if (selectedSlotId.value.isEmpty) {
      Get.snackbar("Error", "Please select a time slot");
      return;
    }

    if (selectedDate.value == null) {
      Get.snackbar("Error", "Booking date missing");
      return;
    }

    isLoading.value = true;

    await BookRoomRepo.bookRoomRepo(
      roomId: roomId,
      slotId: selectedSlotId.value,
      bookingDate: selectedDate.value!,
      notes: notesController.text,
      onSuccess: (message) {
        isLoading.value = false;

        CustomSnackBar.success(message: message);

        Get.to(
          () => RoomAppointmentScreen(),
          arguments: {
            "room": room,
            "date": selectedDate.value,
            "time": selectedTime.value,
          },
        );
      },
      onError: (message) {
        isLoading.value = false;
        CustomSnackBar.error(message: message);
      },
    );
  }

  @override
  void onClose() {
    notesController.dispose();
    super.onClose();
  }
}
