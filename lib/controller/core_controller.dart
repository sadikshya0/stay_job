import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_job/model/users.dart';
import 'package:safe_job/utils/storage_keys.dart';

class CoreController extends GetxController {
  Rx<Users?> currentUser = Rxn<Users>();
  RxString userToken = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadCurrentUser();
  }

  void loadCurrentUser() {
    currentUser.value = StorageHelper.getUser();
    userToken.value =
        StorageHelper.getToken() ?? currentUser.value?.token ?? "";

    log("TOKEN => ${userToken.value}");
    log("User phone: ${currentUser.value?.user?.phone ?? ""}");
  }

  bool isUserLoggedIn() {
    return userToken.value.isNotEmpty;
  }

  void clearUser() async {
    currentUser.value = null;
    userToken.value = "";
    final box = GetStorage();
    await box.remove(StorageKeys.USER);
    await box.remove(StorageKeys.ACCESS_TOKEN);
  }
}
