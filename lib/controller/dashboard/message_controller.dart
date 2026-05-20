import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final TextEditingController messageController = TextEditingController();

  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[
    {
      "message": "Hi I would like to get more information about this job",
      "isMe": true,
    },

    {
      "message":
          "Hi Jeremiah! Sure, would you like to schedule interview for the job?",
      "isMe": false,
    },
  ].obs;

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    messages.add({"message": messageController.text.trim(), "isMe": true});

    messageController.clear();
  }
}
