import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/utils/api.dart';

class ApplyJobRepo {
  static Future<void> applyJobRepo({
    required String job_id,
    required String resume,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.userToken.value.trim();

      var request = http.MultipartRequest("POST", Uri.parse(Api.applyJobUrl));

      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      });

      request.fields["job_id"] = job_id;

      request.files.add(await http.MultipartFile.fromPath("resume", resume));

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      log(response.body);

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"] ?? "Job Applied successfully");
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
