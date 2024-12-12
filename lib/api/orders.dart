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



Future<String?> cancelOrder(String orderId, String status) async {
  String? userId = await UserSecurityStorage.getId();

  // Kiểm tra nếu userId là null
  if (userId == null || userId.isEmpty) {
    throw Exception("Không thể xác định người dùng. Vui lòng đăng nhập lại.");
  }

  var url = Uri.parse('$baseUrl/orders/$orderId/cancel');

  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  var body = jsonEncode({"status": status, "idUser": userId});

  try {
    var response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        return responseData['message'];
      } else {
        // Trả về lỗi từ server
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception("Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại.");
    } else if (response.statusCode == 404) {
      throw Exception("Không tìm thấy đơn hàng hoặc bạn không có quyền hủy.");
    } else {
      // Xử lý các lỗi khác không mong muốn
      throw Exception(
          "Lỗi không xác định. Mã trạng thái: ${response.statusCode}. Vui lòng thử lại.");
    }
  } catch (error) {
    // In lỗi ra console cho mục đích gỡ lỗi
    print("Lỗi khi gọi API hủy đơn hàng: $error");
    rethrow; // Ném lỗi lại để xử lý ở nơi gọi hàm
  }
}



}
