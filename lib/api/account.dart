import 'dart:convert';
import 'package:ecommerce_app_mobile/model/account/account_respone.dart';
import 'package:http/http.dart' as http;

class ApiServicesAccount {
  final String _baseUrl = "https://techzone-2ow9.onrender.com";

  Future<void> sendOtp(String email) async {
    var url = Uri.parse("$_baseUrl/users/email_verification/$email");
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var response = await http.post(url, headers: headers);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
    }
    else{
      throw Exception(responseData['message']);
    }
  }

  Future<void> resetPassword(String email, String password) async {
  var url = Uri.parse("$_baseUrl/users/resetpass");
  var headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  var body = jsonEncode({"email": email, "password": password});

  var response = await http.post(url, headers: headers, body: body);

  var responseData = jsonDecode(response.body);
  // var data = AccountResponse.fromJson(responseData);
  if (response.statusCode == 200) {
    if (responseData['success'] == true) {
      // Đã xác thực thành công
    } else {
      throw Exception(responseData['message']);
      
    }
  } else {
    // Lỗi từ server, ném ra ngoại lệ với thông báo lỗi
    throw Exception(responseData['message']);
  }
}

Future<void> checkVerifyOTPforEmail(String email, String code) async {
  var url = Uri.parse("$_baseUrl/users/verify1");
  var headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  var body = jsonEncode({"email": email, "otp": code});

  var response = await http.post(url, headers: headers, body: body);

  var responseData = jsonDecode(response.body);
  // var data = AccountResponse.fromJson(responseData);
  if (response.statusCode == 200) {
    if (responseData['success'] == true) {
      // Đã xác thực thành công
    } else {
      throw Exception(responseData['message']);
      
    }
  } else {
    // Lỗi từ server, ném ra ngoại lệ với thông báo lỗi
    throw Exception(responseData['message']);
  }
}

  
}
