import 'dart:io';
import 'package:ecommerce_app_mobile/model/filters/filter_respone_data_model.dart';
import 'package:ecommerce_app_mobile/model/filters/product_filter_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';


class ApiServiceFilters {
  static const String baseUrl = 'https://techzone-2ow9.onrender.com';

  Future<List<ProductsFilterDataModel>> getAllProductFilter(String keyword) async {

    var url = Uri.parse('$baseUrl/products/search?keyword=${keyword}');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        
        var response = FilterProductRespone.fromJson(responseData);
        
        return response.products!;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('Đang gặp lỗi');
    } else {
      throw Exception('Gọi api thất bại');
    }
  }

  

  
}