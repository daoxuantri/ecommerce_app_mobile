import 'dart:convert';
import 'package:ecommerce_app_mobile/model/account/account_respone.dart';
import 'package:http/http.dart' as http;

class ApiServicesAccount {
  final String _baseUrl = "http://192.168.1.5:4000/";

  void sendOtp(String email) async {
    var url = Uri.parse("$_baseUrl/account/send-otp?email=$email");
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      // var responseData = AccountResponse.fromJson(response.body);
      print("RESPOSNSE: ${response.body}");
    }
  }

  /// id: vendor id
  /// password: new password
  /// code: otp code
  void resetPassword(String id, String password, String code) async {
    var url = Uri.parse("$_baseUrl/account/reset-password");
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    var body = jsonEncode({"id": id, "password": password, "code": code});

    var response = await http.post(url, headers: headers, body: body);

    var responseData = jsonDecode(response.body);
    var data = AccountResponse.fromJson(responseData);

    print("RESET PASSWORD: ${data.message}");
  }

  /// id: vendor id
  /// code: otp code
  void confirmEmail(String id, String code) async {
    var url = Uri.parse("$_baseUrl/account/confirm-email/$id/$code");
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var response = await http.post(url, headers: headers);
  }
}
