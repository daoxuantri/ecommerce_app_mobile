import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/list_address_data_respone.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_respone.dart';
import 'package:ecommerce_app_mobile/model/vnpay/vnpay_data_model_respone.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceUsers {
  static const String baseUrl = 'https://techzone-2ow9.onrender.com';

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



  //GET
  Future<UserDataModel> getDetailUser() async {
    String? userId = await UserSecurityStorage.getId();
    var url = Uri.parse('$baseUrl/users/$userId');

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var response = await http.get(url, headers: headers);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      
      if (responseData['success'] == true) {
        var response = UserResponeData.fromJson(responseData);
        return response.data!;
        
      } else {
        throw Exception(responseData['message']);
      }
    } else {
      throw Exception(responseData['message']);
    }
  }



  Future<List<AddressDataModel>>
      getAllAddressShipping() async {
    // await CheckToken.checkExpireToken();
    String? token = await UserSecurityStorage.getToken();
    var url = Uri.parse('$baseUrl/address');

    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = ListAddressDataRespone.fromJson(responseData);
       
        return response.data!;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api');
    }
  }


  Future<AddressDataModel?>
      getDefaultAddressShiping() async {
    String? token = await UserSecurityStorage.getToken();
    var url = Uri.parse('$baseUrl/address/getdefault');

    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        if (responseData['data'] is List && responseData['data'].isEmpty) {
          return null; 
        }
        var response = ListAddressDataRespone.fromJson(responseData);
        return response.data!.first;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api');
    }
  }


  Future<String?>
      setDefaultAddressShiping(String? idAddress) async {
    String? token = await UserSecurityStorage.getToken();
    var url = Uri.parse('$baseUrl/address/');
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
     var body = json.encode({
    'addressId': idAddress,
  });

    var response = await http.put(url, headers: headers, body : body);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        return responseData['message'];
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api');
    }
  }

  Future<String?> createAddressByUser(String address, String name , String phone, bool status) async {
    var url = Uri.parse('$baseUrl/address/create');
    String? token = await UserSecurityStorage.getToken();

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = json.encode({
      'address': address, 
      'name': name ,
      'phone': phone , 
      'status': status
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body); 
      return responseData['message']; 
    } else {
      throw Exception('fail to call api');
    }
  }

  Future<String?>
      addressRemoveAddressByUser(String? idLocation) async {
    String? token = await UserSecurityStorage.getToken();
    var url = Uri.parse('$baseUrl/address/${idLocation}');

    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    };


    var response = await http.delete(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
       return responseData['message'];
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api ');
    }
  }
  

  Future<String?>
      getVNPay(int amount ) async {
    // await CheckToken.checkExpireToken();
    var url = Uri.parse('$baseUrl/payment/create_payment_url');
    // final String? token = await UserSecureStorage.getToken();

    // var headers = {
    //   'accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = json.encode({
      'amount': amount, 
    });
    print(amount);

    print('Payload body: $body');


    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = VnPayRespone.fromJson(responseData);
               
        return response.paymentUrl;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api');
    }
  }


  

}