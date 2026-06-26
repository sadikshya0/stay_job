import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/model/job.dart';
import 'package:safe_job/utils/api.dart';

class GetJobsRepo {
  static Future<void> getJobsRepo({
    required Function(List<Job> job) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();

      final token = coreController.userToken.value;

      log("TOKEN => $token");

      if (token.isEmpty) {
        onError("User token missing. Please login again.");
        return;
      }

      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final url = Uri.parse(Api.getJobsUrl);

      final response = await http.get(url, headers: headers);

      log("STATUS CODE: ${response.statusCode}");
      log("RAW RESPONSE: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (data['data'] is List) {
          final List<Job> job = jobFromJson(data['data'] as List<dynamic>);

          onSuccess(job);
        } else {
          onSuccess([]);
        }
      } else {
        onError(data['message'] ?? "Something went wrong");
      }
    } catch (e, s) {
      log("ERROR: $e");
      log("STACK: $s");
      onError("Something went wrong");
    }
  }
}
