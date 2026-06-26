import 'package:get/get.dart';
import 'package:safe_job/model/room.dart';
import 'package:safe_job/repo/get_room_repo.dart';
import 'package:safe_job/utils/custom_snackbar.dart';

class RoomScreenController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoading = false.obs;

  RxList<Room> roomList = <Room>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRooms();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> fetchRooms() async {
    try {
      isLoading.value = true;

      await GetRoomRepo.roomRepo(
        onSuccess: (rooms) {
          roomList.assignAll(rooms);
        },
        onError: (message) {
          CustomSnackBar.error(message: message);
        },
      );
    } finally {
      isLoading.value = false;
    }
  }
}
