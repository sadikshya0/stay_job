import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ApplicationScreenController extends GetxController {
  RxString fileName = "".obs;
  RxString filePath = "".obs;
  RxBool isApplied = false.obs;

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
}
