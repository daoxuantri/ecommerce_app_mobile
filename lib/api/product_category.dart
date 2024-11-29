
import 'package:ecommerce_app_mobile/model/product_category/get_list_category_response.dart';
import 'package:ecommerce_app_mobile/model/product_category/product_category_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServiceProductCategory {
  static const String baseUrl = 'http://172.31.98.146:4000';
  Future<List<ProductCategoryDataModel>> getListCategory() async {
    // await CheckToken.checkExpireToken();
    var url = Uri.parse('$baseUrl/categories/');
    // final String? token = await UserSecureStorage.getToken();

    // var headers = {
    //   'accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    // var response = await http.get(url, headers: headers);

    // if (response.statusCode == 200) {
    //   var responseData = json.decode(response.body);
    //   if (responseData['success'] == true) {
    //     var response = GetListCategoryResponse.fromJson(responseData);
    //     return response.data!;
    //   } else {
    //     throw Exception(responseData['message']);
    //   }
    // } else if (response.statusCode == 401) {
    //   throw Exception('phiên đăng nhập hết hạn');
    // } else {
    //   throw Exception('fail to call api get list product colors');
    // }
  var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = GetListCategoryResponse.fromJson(responseData);
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

//   Future<ProductCategoryDataModel> getProductCategoryDetail(String id) async {
//     await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/productcategories/$id');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     var response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//         var response = GetCategoryByIdResponse.fromJson(responseData);
//         return response.data!;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api get list product colors');
//     }
//   }

//   Future<List<ProductCategoryDataModel>> getChildrenByIdCategory(String id) async {
//     await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/productcategories/$id/children');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     var response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//         var response = GetChildrenByIdCategoryResponse.fromJson(responseData);
//         return response.data!;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api get list product colors');
//     }
//   }

}