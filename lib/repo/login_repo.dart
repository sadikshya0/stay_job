import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:safe_job/model/users.dart';
import 'package:safe_job/utils/api.dart';

class LoginRepo {
  static Future<void> loginRepo({
    required String phone,
    required String password,
    required Function(User user, String token, String message) onSuccess,
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
      dynamic data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = data["token"].toString();
        User user = User.fromJson(data);
        log(User.fromJson(data["user"]).toString());
        onSuccess(user, accessToken, data['message']);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry, something went wrong");
    }
  }
}
