import 'dart:developer';
import 'package:get/get.dart';
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

  /// LOAD USER FROM STORAGE
  void loadCurrentUser() {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken() ?? "";

    log("User Phone: ${currentUser.value?.user}");
    log("Token: ${userToken.value}");
  }

  /// CHECK LOGIN STATUS
  bool isUserLoggedIn() {
    return currentUser.value != null;
  }
}
