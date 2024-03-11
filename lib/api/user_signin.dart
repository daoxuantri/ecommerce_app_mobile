import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceVendors {
  static const String baseUrl = 'http://192.168.1.16:4000';

  //POST
  Future<void> signUpMini(String email, String phone, String password,
      String username) async {
    var url = Uri.parse('$baseUrl/users/register');

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'email': email,
      'contact': phone,
      'password': password,
      'username': username, 
    });

    var response = await http.post(url, headers: headers, body: body);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      
      if (responseData['success'] == true) {
        
      } else {
        throw Exception(responseData['message']);
      }
    } else {
      throw Exception(responseData['message']);
    }
  }

}