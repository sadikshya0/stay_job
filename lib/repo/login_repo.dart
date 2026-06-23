import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:safe_job/model/users.dart';
import 'package:safe_job/utils/api.dart';

class LoginRepo {
  static Future<void> loginRepo({
    required String phone,
    required String password,
    required Function(Users user, String token, String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {"Accept": "application/json"};
      var body = {"phone": phone, "password": password};
      http.Response response = await http.post(
        Uri.parse(Api.loginUrl),
        headers: headers,
        body: body,
      );
      log("URL ${Uri.parse(Api.loginUrl)}");
      log("$body");
      dynamic data = jsonDecode(response.body);
      log("login : $data");
      if (data["status"] == "success") {
        String token = json.encode(['token']);
        Users user = Users.fromJson(data['user']);
        onSuccess(user, token, data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
