import 'dart:io'; 
import 'package:ecommerce_app_mobile/model/cart/my_cart_data_model.dart';
import 'package:ecommerce_app_mobile/model/cart/my_cart_respone.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
 


class ApiServiceCart {
  static const String baseUrl = 'http://172.31.98.146:4000';

  Future <MyCartDataModel> getCartById(String userId) async {

    var url = Uri.parse('$baseUrl/carts/$userId/user');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = GetCartByIdRespone.fromJson(responseData);
        return response.data!;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('Đang gặp lỗi');
    } else {
      throw Exception('Gọi api thất bại');
    }
  }



  Future<String> deleteAllProduct(String id) async {
    

    var url = Uri.parse('$baseUrl/carts/removeall'); 

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'user': id, 
    });

    var response = await http.post(url, headers: headers, body: body);

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
      throw Exception('fail to call api delete vendor shipping address');
    }
  }

  Future<String> deleteProduct(String productId) async {
    

    String? userId = await UserSecurityStorage.getId();

    var url = Uri.parse('$baseUrl/carts/'); 


    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'user': userId, 
      'product': productId
    });
    print('Check api');
    print(userId);
    print(productId);

    var response = await http.post(url, headers: headers, body: body);

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
      throw Exception('fail to call api delete vendor shipping address');
    }
  }

  Future<String> updateQuantityProduct(String productId, int quantity, String? color , String? memory) async {
    

    String? userId = await UserSecurityStorage.getId();

    var url = Uri.parse('$baseUrl/carts/'); 


    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'user': userId, 
      'product': productId,
      'quantity': quantity,
      'color': color,
      'memory': memory
    });

    var response = await http.put(url, headers: headers, body: body);

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
      throw Exception('fail to call api delete vendor shipping address');
    }
  }

  
}

  



