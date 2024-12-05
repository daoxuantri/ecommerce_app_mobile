// class GetCitiesResponse {
//   bool? success;
//   int? code;
//   String? message;
//   List<CitiData>? data;

//   GetCitiesResponse({this.success, this.code, this.message, this.data});

//   GetCitiesResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <CitiData>[];
//       json['data'].forEach((v) {
//         data!.add(new CitiData.fromJson(v));
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

// class CitiData {
//   String? id;
//   String? name;

//   CitiData({this.id, this.name});

//   CitiData.fromJson(Map<String, dynamic> json) {
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



class GetCitiesRespone {
  List<CitiData>? results;

  GetCitiesRespone({this.results});

  GetCitiesRespone.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CitiData>[];
      json['results'].forEach((v) {
        results!.add(new CitiData.fromJson(v));
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


class CitiData {
   String? provinceId;
  String? provinceName;

  CitiData({this.provinceId, this.provinceName});

  CitiData.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    provinceName = json['province_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province_id'] = this.provinceId;
    data['province_name'] = this.provinceName;
    return data;
  }
}
