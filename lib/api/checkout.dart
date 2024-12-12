import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:ecommerce_app_mobile/screens/checkout/components/model.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceCheckout {
  static const String baseUrl = 'http://192.168.2.183:4000';

  Future<String> createOrderByUser (String idUser , List<ProductItem> productItems, InformationUser  userInformation, bool paid, String billCode) async {
  var url = Uri.parse('$baseUrl/orders');

  var headers = {
    'Content-Type': 'application/json',
    'accept': 'application/json',
  };
  var body = {
    'user': idUser ,
    'productItem': productItems.map((item) => item.toJson()).toList(),
    'informationUser': userInformation.toJson(),
    'paid': paid,
    'billCode': billCode
    };

  
  var response = await http.post(
    url,
    headers: headers,
    body: json.encode(body),
  );

  var responseData = json.decode(response.body);
  if (response.statusCode == 201) {
    return responseData['message']; 
  } else {
    throw Exception('Fail to call API post create order');
  }
}


  
  

}
