import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/utils/api.dart';

class DeleteAllNotificationRepo {
  static Future<void> deleteAllNotificationRepo({
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.userToken.value.trim();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      http.Response response = await http.delete(
        Uri.parse(Api.deleteAllNotificationUrl),
        headers: headers,
      );

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
      } else {
        onError(data["message"] ?? "Something went wrong");
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
