import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  RxString userName = "John Doe".obs;
  RxString email = "johndoe34@gmail.com".obs;

  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  RxBool isLoading = false.obs;

  void editProfile({required String name, required String userEmail}) {
    userName.value = name;
    email.value = userEmail;
  }

  Future<void> pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }
}
