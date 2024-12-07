import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServiceAddress {
  static const String baseUrl = 'https://vapi.vnappmob.com/api';

  static Future<List<CitiData>> getCities() async {
    var url = Uri.parse('$baseUrl/province');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      
      var respone = GetCitiesRespone.fromJson(responseData);

      return respone.results!;
    } else {
      throw Exception('Fail to call API get cities');
    }
  }


  static Future<List<DistrictData>> getDistricts(String cityId) async {
    //2d58a30a-d747-4ad2-9a10-62dc955b418a
    var url = Uri.parse('$baseUrl/province/district/${cityId}');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var responseValue = GetDistrictsResponse.fromJson(responseData);
      return responseValue.results!;
    } else {
      throw Exception('fail to call api get districts');
    }
  }

  static Future<List<WardData>> getWards(String districtId) async {
    //eaa81d4f-acd7-49f5-b7e0-277db22c8591
    var url = Uri.parse('$baseUrl/province/ward/${districtId}');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var responseValue = GetWardsResponse.fromJson(responseData);
        return responseValue.results!;
    } else {
      throw Exception('fail to call api get wards');
    }
  }

  

}
