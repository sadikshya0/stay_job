import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safe_job/utils/custom_snackbar.dart';

class EditProfileController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString selectedGender = "".obs;

  RxString selectedDOB = "".obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      CustomSnackBar.error(message: "Failed to pick image from camera");
    }
  }

  Future<void> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      CustomSnackBar.error(message: "Failed to pick image from gallery");
    }
  }
}
