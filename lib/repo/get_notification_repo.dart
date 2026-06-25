import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/model/notification.dart';
import 'package:safe_job/utils/api.dart';

class GetNotificationRepo {
  static Future<void> getNotificationRepo({
    required Function(List<Notification> notification) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.userToken.value.trim();
      log("TOKEN => $token");

      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      log("HEADERS => $headers");
      var url = Uri.parse(Api.notificationUrl);

      final response = await http.get(url, headers: headers);

      log("STATUS CODE: ${response.statusCode}");
      log("RAW RESPONSE: ${response.body}");

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final rawList = data['data'];

        if (rawList != null && rawList is List) {
          final notification = notificationFromJson(rawList);
          onSuccess(notification);
        } else {
          onSuccess([]);
        }
      } else {
        onError(data['message'] ?? "Something went wrong");
      }
    } catch (e, s) {
      log("ERROR: $e");
      log("STACK: $s");
      onError("Sorry! something went wrong");
    }
  }
}
