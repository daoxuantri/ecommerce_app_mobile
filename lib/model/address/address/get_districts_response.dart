// class GetDistrictsResponse {
//   bool? success;
//   int? code;
//   String? message;
//   List<DistrictData>? data;

//   GetDistrictsResponse({this.success, this.code, this.message, this.data});

//   GetDistrictsResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <DistrictData>[];
//       json['data'].forEach((v) {
//         data!.add(new DistrictData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class DistrictData {
//   String? id;
//   String? name;

//   DistrictData({this.id, this.name});

//   DistrictData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }



class GetDistrictsResponse {
  List<DistrictData>? results;

  GetDistrictsResponse({this.results});

  GetDistrictsResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <DistrictData>[];
      json['results'].forEach((v) {
        results!.add(new DistrictData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistrictData {
  String? districtId;
  String? districtName;

  DistrictData(
      {this.districtId,
      this.districtName});

  DistrictData.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;
    return data;
  }
}