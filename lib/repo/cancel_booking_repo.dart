import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/utils/api.dart';

class CancelBookingRepo {
  static Future<void> cancelBookingRepo({
    required String bookingId,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.find<CoreController>();
      final token = coreController.userToken.value.trim();

      if (token.isEmpty) {
        onError("User token not found");
        return;
      }

      final body = {"booking_id": bookingId};

      log("REQUEST BODY: $body");

      final response = await http.post(
        Uri.parse(Api.cancelBookingUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body, // form-urlencoded
      );

      log("STATUS CODE: ${response.statusCode}");
      log("RESPONSE BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          data["status"] == "success") {
        onSuccess(data["message"] ?? "Booking cancelled successfully");
      } else {
        onError(data["message"] ?? "Something went wrong");
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
