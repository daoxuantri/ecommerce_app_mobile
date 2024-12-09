import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/filter_product_category/filter_product_cate_respone.dart';
import 'package:ecommerce_app_mobile/model/filter_product_category/product_filter_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceCategory {
  static const String baseUrl = 'http://192.168.2.183:4000';

  Future<List<ProductFilterDataModel>> getListProductByCategory(String idCategory) async {
    var url = Uri.parse('$baseUrl/categories/${idCategory}/productsflutter');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      
      var respone = FilterProductCategoriesRespone.fromJson(responseData);
      return respone.data!;
 
    } else {
      throw Exception('Fail to call API getlist');
    }
  }


  

}
