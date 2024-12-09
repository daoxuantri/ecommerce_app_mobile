import 'package:ecommerce_app_mobile/model/orders/get_list_order_response.dart';
import 'package:ecommerce_app_mobile/model/orders/order_data_model.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceOrders {
  static const String baseUrl = 'http://192.168.2.183:4000';

  Future<List<OrderDataModel>> getListOrder({ String? status}) async {
    String? userId = await UserSecurityStorage.getId();

    var url  = Uri.parse('$baseUrl/orders/${userId}?status=${status}');

    if(status == null){
      url = Uri.parse('$baseUrl/orders/${userId}');
    }
   
    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);


    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = GetListOrderResponse.fromJson(responseData);
       
        return response.order!;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api get list order');
    }
  }






}
