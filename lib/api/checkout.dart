
import 'package:ecommerce_app_mobile/screens/checkout/components/model.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceCheckout {
  static const String baseUrl = 'https://techzone-2ow9.onrender.com';

  Future<String> createOrderByUser ( List<ProductItem> productItems, InformationUser  userInformation, bool paid, String billCode) async {
  var url = Uri.parse('$baseUrl/orders');
  String? token = await UserSecurityStorage.getToken();

  var headers = {
    'Content-Type': 'application/json',
    'accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var body = {
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
