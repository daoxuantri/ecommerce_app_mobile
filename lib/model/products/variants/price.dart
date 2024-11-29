class Price {
  int? initial;
  int? discount;

  Price({this.initial, this.discount});

  Price.fromJson(Map<String, dynamic> json) {
    initial = json['initial'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initial'] = this.initial;
    data['discount'] = this.discount;
    return data;
  }
}