import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/model/authentication/user_login.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert';
class ApiServiceAuth{
  static const String baseUrl='https://techzone-2ow9.onrender.com';

  String getCookie(String header) {
    int refreshTokenStart = header.indexOf("refreshToken=");
    int refreshTokenEnd = header.indexOf(";", refreshTokenStart);
    String Cookie = header.substring(refreshTokenStart, refreshTokenEnd);
    return Cookie;
  }

  Future<void> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/users/login');
  


    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'email': email,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      

      if (responseData['success'] == true) {
        var user = UserLogin.fromJson(responseData);
        String? token = user.data!.accessToken;
        String? username = user.data!.username;
        String? id = user.data!.id;
        // String? role = user.data!.role;
        //dung secure storage de luu tai khoan
        UserSecurityStorage.setId(id!);
        UserSecurityStorage.setEmail(email);
        UserSecurityStorage.setUsername(username!);
        // UserSecurityStorage.setPassword(password);
         UserSecurityStorage.setToken(token!);
        // UserSecurityStorage.setRole(role!); 
       
        //lay ngay het han cua token
        // DateTime expirationDate =
        //     JwtDecoder.getExpirationDate(token.toString());
        // // setExpire
        // //luu lai cookie de refresh token
        // String header = response.headers.toString();
        // String Cookie = getCookie(header);
        // UserSecurityStorage.setCookie(Cookie);
        print('thanh cong ');

      } else {
        throw Exception(responseData['message']);
      }
    } else {
      throw Exception(responseData['message']);
      
    }
  }

  // Future<void> refreshToken() async {
  //   var url = Uri.parse('$baseUrl/auth/refresh-token');
  //   final String? cookie = await UserSecurityStorage.getCookie();

  //   var headers = {
  //     'accept': 'application/json',
  //     'Cookie': '$cookie',
  //   };

  //   var response = await http.post(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     var responseData = json.decode(response.body);

  //     if (responseData['success'] == true) {
  //       var user = UserLogin.fromJson(responseData);
  //       String? token = user.data!.jwtToken;
  //       //dung secure storage de luu tai khoan
  //       UserSecurityStorage.setToken(token!);
  //       //lay ngay het han cua token
  //       DateTime expirationDate =
  //           JwtDecoder.getExpirationDate(token.toString());
  //     //setexpire
  //       //luu lai cookie de refresh token
  //       String header = response.headers.toString();
  //       String Cookie = getCookie(header);
  //       UserSecurityStorage.setCookie(Cookie);
  //     } else {
  //       throw Exception(responseData['message']);
  //     }
  //   } else {
  //     throw Exception('Refresh token fail');
  //   }
  // }

  //
  Future<void> logout() async {
    // String? cookie = await UserSecurityStorage.getCookie();
    // cookie = cookie!.substring(cookie.indexOf('=') + 1);

    // var url = Uri.parse('$baseUrl/auth/logout?RefreshToken=$cookie');
    // var headers = {
    //   'accept': 'application/json',
    // };

    // var response = await http.get(url, headers: headers);

    // if (response.statusCode == 200) {
    //   var responseData = json.decode(response.body);
    //   if (responseData['success'] == true) {
    //     UserSecurityStorage.deleteAll();
    //   } else {
    //     throw Exception(responseData['message']);
    //   }
    // } else {
    //   throw Exception('logout token fail');
    // }

    UserSecurityStorage.deleteAll();
  }

  //Quên mật khẩu

  Future<void> sendotp(String email) async {
    var url = Uri.parse('$baseUrl/account/send-otp?email=$email');

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      if (responseData['success'] == false) {
        throw Exception(responseData['message']);
      }
    } else {
      throw Exception('logout token fail');
    }
  }

  Future<void> resetpassword(String id, String password, String code) async {
    var url = Uri.parse('$baseUrl/account/reset-password');

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body =
        json.encode({"id": "string", "password": "stringst", "code": "string"});

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      if (responseData['success'] == false) {
        throw Exception(responseData['message']);
      }
    } else {
      throw Exception('logout token fail');
    }
  }

  Future<void> confirmemail(String id, String code) async {
    var url = Uri.parse('$baseUrl/account/confirm-email/$id/$code');

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      if (responseData['success'] == false) {
        throw Exception(responseData['message']);
      }
    } else {
      throw Exception('logout token fail');
    }
  }
}