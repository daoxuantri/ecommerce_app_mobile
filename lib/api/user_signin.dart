import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/list_address_data_respone.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_respone.dart';
import 'package:ecommerce_app_mobile/model/vnpay/vnpay_data_model_respone.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceUsers {
  static const String baseUrl = 'http://192.168.2.183:4000';

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
    String? idUser = await UserSecurityStorage.getId();
    var url = Uri.parse('$baseUrl/address/$idUser');
    // final String? token = await UserSecureStorage.getToken();

    // var headers = {
    //   'accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    var headers = {
      'accept': 'application/json',
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
      throw Exception('fail to call api get vendor shipping address');
    }
  }


  Future<AddressDataModel?>
      getDefaultAddressShiping() async {
    // await CheckToken.checkExpireToken();
    String? idUser = await UserSecurityStorage.getId();
    var url = Uri.parse('$baseUrl/address/$idUser/getdefault');
    // final String? token = await UserSecureStorage.getToken();

    // var headers = {
    //   'accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        if (responseData['data'] is List && responseData['data'].isEmpty) {
          print('Address data is empty.');
          return null; // Trả về null khi không có địa chỉ
        }
        var response = ListAddressDataRespone.fromJson(responseData);
        return response.data!.first;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api get vendor shipping address');
    }
  }

  Future<String?> createAddressByUser(String address, String name , String phone, bool status) async {
    var url = Uri.parse('$baseUrl/address/create');
    String? idUser = await UserSecurityStorage.getId();

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var body = json.encode({
      'userId':idUser,
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
      print('Loi tai nay');
      throw Exception('fail to call api get wards');
    }
  }

  Future<String?>
      addressRemoveAddressByUser(String? idAddress) async {
    // await CheckToken.checkExpireToken();
    String? idUser = await UserSecurityStorage.getId();
    var url = Uri.parse('$baseUrl/address/user/${idUser}/location/${idAddress}');
    // final String? token = await UserSecureStorage.getToken();

    // var headers = {
    //   'accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };


    var headers = {
      'accept': 'application/json',
    };

    var response = await http.delete(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
       return responseData['message'];
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api get vendor shipping address');
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
      throw Exception('fail to call api get vendor shipping address');
    }
  }


  

}