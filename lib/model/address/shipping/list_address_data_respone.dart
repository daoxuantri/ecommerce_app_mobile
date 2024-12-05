import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';

class ListAddressDataRespone {
  bool? success;
  String? message;
  List<AddressDataModel>? data;

  ListAddressDataRespone({this.success, this.message, this.data});

  ListAddressDataRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AddressDataModel>[];
      json['data'].forEach((v) {
        data!.add(new AddressDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
