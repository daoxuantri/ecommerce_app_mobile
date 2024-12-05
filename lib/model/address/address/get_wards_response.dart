// class GetWardsResponse {
//   bool? success;
//   int? code;
//   String? message;
//   List<WardData>? data;

//   GetWardsResponse({this.success, this.code, this.message, this.data});

//   GetWardsResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <WardData>[];
//       json['data'].forEach((v) {
//         data!.add(new WardData.fromJson(v));
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

// class WardData {
//   String? id;
//   String? name;

//   WardData({this.id, this.name});

//   WardData.fromJson(Map<String, dynamic> json) {
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


class GetWardsResponse {
  List<WardData>? results;

  GetWardsResponse({this.results});

  GetWardsResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <WardData>[];
      json['results'].forEach((v) {
        results!.add(new WardData.fromJson(v));
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

class WardData {
  String? wardId;
  String? wardName;

  WardData({this.wardId, this.wardName});

  WardData.fromJson(Map<String, dynamic> json) {
    wardId = json['ward_id'];
    wardName = json['ward_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ward_id'] = this.wardId;
    data['ward_name'] = this.wardName;
    return data;
  }
}
