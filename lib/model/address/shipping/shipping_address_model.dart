class UserShippingAddressData {
  String? id;
  String? vendorId;
  String? name;
  String? phone;
  String? addressId;
  String? addressCountryId;
  String? addressCityId;
  String? addressCityName;
  String? addressDistrictId;
  String? addressDistrictName;
  String? addressWardId;
  String? addressWardName;
  String? addressStreet;
  bool? isDefault;

  UserShippingAddressData(
      {this.id,
        this.vendorId,
        this.name,
        this.phone,
        this.addressId,
        this.addressCountryId,
        this.addressCityId,
        this.addressCityName,
        this.addressDistrictId,
        this.addressDistrictName,
        this.addressWardId,
        this.addressWardName,
        this.addressStreet,
        this.isDefault});

  UserShippingAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendorId'];
    name = json['name'];
    phone = json['phone'];
    addressId = json['addressId'];
    addressCountryId = json['addressCountryId'];
    addressCityId = json['addressCityId'];
    addressCityName = json['addressCityName'];
    addressDistrictId = json['addressDistrictId'];
    addressDistrictName = json['addressDistrictName'];
    addressWardId = json['addressWardId'];
    addressWardName = json['addressWardName'];
    addressStreet = json['addressStreet'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendorId'] = this.vendorId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['addressId'] = this.addressId;
    data['addressCountryId'] = this.addressCountryId;
    data['addressCityId'] = this.addressCityId;
    data['addressCityName'] = this.addressCityName;
    data['addressDistrictId'] = this.addressDistrictId;
    data['addressDistrictName'] = this.addressDistrictName;
    data['addressWardId'] = this.addressWardId;
    data['addressWardName'] = this.addressWardName;
    data['addressStreet'] = this.addressStreet;
    data['isDefault'] = this.isDefault;
    return data;
  }
}