class VnPayRespone {
  bool? success;
  String? paymentUrl;

  VnPayRespone({this.success, this.paymentUrl});

  VnPayRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    paymentUrl = json['paymentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['paymentUrl'] = this.paymentUrl;
    return data;
  }
}