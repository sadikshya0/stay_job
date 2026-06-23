import 'package:get/get.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/repo/get_room_repo.dart';

class RoomViewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Room?> room = Rxn<Room>();

  void loadRoom() async {
    isLoading.value = true;

    await GetRoomRepo.roomRepo(
      onSuccess: (rooms) {
        if (rooms.isNotEmpty) {
          room.value = rooms.first; // or find by id later
        }
        isLoading.value = false;
      },
      onError: (msg) {
        isLoading.value = false;
        Get.snackbar("Error", msg);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadRoom();
  }
}
