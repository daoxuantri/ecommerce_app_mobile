import 'dart:io';
import 'package:ecommerce_app_mobile/model/home/data_respone_home.dart';
import 'package:ecommerce_app_mobile/model/home/home_respone.dart';
import 'package:ecommerce_app_mobile/model/products/get_all_product_response.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

import '../model/products/product_data_model.dart';


class ApiServiceProducts {
  static const String baseUrl = 'http://172.31.98.146:4000';

  Future <Data> getAllProduct() async {

    var url = Uri.parse('$baseUrl/products/homeflutter');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = HomeRespone.fromJson(responseData);
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

//   Future<ProductDataModel> getDetailProduct(String productId) async {
//     await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/products/$productId');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     var response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//         var response =
//             ProductDetailResponse.fromJson(responseData);
//         return response.data!;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api get detail product');
//     }
//   }

//   //Tao san pham

//   // Cap nhat san pham
//   //326760a6-cf15-4c92-89ad-f4877bb83f85
//   //chay thanh cong nhung chua thay image duoc
//   //ProductDataModel updateProductResponse =
//   //       await ApiServiceProducts().updateProduct(
//   //       khai bao bth, image them duoi dang file:
//   //       Image: '@abc.jpg;type=image/jpeg',

//   Future<ProductDataModel> updateProduct(
//       String productId,
//       String name,
//       double CommissionValuePercent,
//       double CommissionValueFlat,
//       String Unit,
//       String CommissionType,
//       String ProductColorId,
//       String CategoryId,
//       {int? Length,
//       int? HeadSize,
//       int? Diameter,
//       String? CountryId,
//       File? imageFile}) async {
//     await CheckToken.checkExpireToken();
//     var url = Uri.parse('https://vendor.rest.hoafmp.com/products/$productId');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Content-Type': 'multipart/form-data',
//       'Authorization': 'Bearer $token',
//     };

//     var request = http.MultipartRequest('PUT', url);
//     request.headers.addAll(headers);
//     request.fields['HeadSize'] = '$HeadSize';
//     request.fields['Unit'] = '$Unit';
//     request.fields['CommissionType'] = '$CommissionType';
//     request.fields['Length'] = '$Length';
//     request.fields['Name'] = '$name';
//     request.fields['Diameter'] = '$Diameter';
//     request.fields['ProductColorId'] = '$ProductColorId';
//     request.fields['CountryId'] = '$CountryId';
//     request.fields['CategoryId'] = '$CategoryId';
//     //request.fields['Image'] = '@'+imageFile!.path.toString()+';type=image/jpg';
//     //request.fields['imageName'] = '';
//     request.fields['CommissionValuePercent'] = '$CommissionValuePercent';
//     request.fields['CommissionValueFlat'] = '$CommissionValueFlat';

//     // Kiểm tra và đính kèm file ảnh (nếu có), chua chay duoc
//     if (imageFile != null) {
//       var stream = http.ByteStream(imageFile.openRead());
//       var length = await imageFile.length();
//       var multipartFile = http.MultipartFile('Image', stream, length,
//           filename: imageFile.uri.toString(), contentType: MediaType('image', 'jpg'));
//       request.files.add(multipartFile);
//     }
//     var response = await request.send();


//     if (response.statusCode == 200) {
//       var responseData = json.decode(await response.stream.bytesToString());
//       if (responseData['success'] == true) {
//         var response = UpdateProductResponse.fromJson(responseData);
//         return response.data!;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api update product');
//     }
//   }

//   // Lay danh sach san pham da yeu thich day du
//   Future<List<ProductDataModel>> getListProductSubscribe() async {
//     await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/products/subscribed');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     var response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//         var response = GetListProductSubscribeResponse.fromJson(responseData);
//         return response.data!;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api get list product subscribe');
//     }
//   }

//   // Lay danh sach san pham da yeu thich mini
//   // chi lay id, name, unit
//   Future<List<ProductDataMiniModel>> getMiniListProductSubscribe() async {
//     await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/products/subscribed/mini');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     var response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//         var response =
//             GetMiniListProductSubscribeResponse.fromJson(responseData);
//         return response.data!;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api get list mini product subscribe');
//     }
//   }

//   // Yeu thich san pham, tra ve true neu thanh cong
//   Future<bool> subscribeProduct(String id) async {
//     await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/products/$id/subscribe');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     var response = await http.post(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//         return true;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api subscribe product');
//     }
//   }

//   // Bo yeu thich san pham, tra ve true neu thanh cong
//   Future<bool> unsubscribeProduct(String id) async {
//     await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/products/$id/unsubscribe');
//     final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     var response = await http.post(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//         return true;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api unsubscribe product');
//     }
//   }
}
