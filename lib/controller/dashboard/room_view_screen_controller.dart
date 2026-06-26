import 'package:get/get.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/repo/get_room_repo.dart';
import 'package:safe_job/utils/custom_snackbar.dart';

class RoomViewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Room?> room = Rxn<Room>();

  void loadRoom() async {
    isLoading.value = true;

    await GetRoomRepo.roomRepo(
      onSuccess: (rooms) {
        if (rooms.isNotEmpty) {
          room.value = rooms.first;
        }
        isLoading.value = false;
      },
      onError: (msg) {
        isLoading.value = false;
        CustomSnackBar.success(message: msg);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadRoom();
  }
}
