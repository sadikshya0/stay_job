import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:safe_job/repo/apply_job_repo.dart';
import 'package:safe_job/utils/custom_snackbar.dart';
import 'package:safe_job/view/dashboard/dash_screen.dart';

class ApplicationScreenController extends GetxController {
  RxString fileName = "".obs;
  RxString filePath = "".obs;

  RxBool isApplied = false.obs;
  RxBool isLoading = false.obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      fileName.value = result.files.single.name;
      filePath.value = result.files.single.path ?? "";
    }
  }

  Future<void> applyJob({required String jobId}) async {
    if (filePath.value.isEmpty) {
      Get.snackbar("Error", "Please upload your resume");
      return;
    }

    isLoading.value = true;

    await ApplyJobRepo.applyJobRepo(
      job_id: jobId,
      resume: filePath.value,
      onSuccess: (message) {
        isLoading.value = false;
        isApplied.value = true;
        CustomSnackBar.success(title: "Job", message: message);
        Get.offAll(() => DashScreen());
      },
      onError: (message) {
        isLoading.value = false;
        CustomSnackBar.error(title: "Job", message: message);
      },
    );
  }
}
