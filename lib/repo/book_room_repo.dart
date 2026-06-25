import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:safe_job/controller/core_controller.dart';
import 'package:safe_job/utils/api.dart';

class BookRoomRepo {
  static Future<void> bookRoomRepo({
    required String roomId,
    required String slotId,
    required DateTime bookingDate,
    required String notes,
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

      // IMPORTANT: backend expects date only (not full ISO timestamp)
      final formattedDate =
          "${bookingDate.year}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}";

      final body = {
        "room_id": roomId,
        "slot_id": slotId,
        "booking_date": formattedDate,
        "notes": notes,
      };

      log("REQUEST BODY: ${jsonEncode(body)}");

      final response = await http.post(
        Uri.parse(Api.bookRoomUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );

      log("STATUS CODE: ${response.statusCode}");
      log("RESPONSE BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"] ?? "Booking successful");
      } else {
        onError(data["message"] ?? "Something went wrong");
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
