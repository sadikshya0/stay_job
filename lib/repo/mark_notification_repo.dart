import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/utils/api.dart';

class MarkNotificationsRepo {
  static Future<void> markNotificationRepo({
    required String notification_id,
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

      var body = {"notification_id": notification_id};

      http.Response response = await http.post(
        Uri.parse(Api.markNotificationUrl),
        headers: headers,
        body: body,
      );

      dynamic data = jsonDecode(response.body);
      log("body: $body");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
