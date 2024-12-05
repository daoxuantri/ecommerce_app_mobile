// import 'package:flutter/material.dart';
// import 'package:fmp_vendor/model/vendor_rest_model/vendors/company_detail_response.dart';
// import 'package:fmp_vendor/size_config.dart';

// class VendorInfoBody extends StatelessWidget {
//   const VendorInfoBody({super.key, required this.profile});

//   final CompanyDetailData profile;

//   @override
//   Widget build(BuildContext context) {
//     bool isPersonal = profile.isPersonal != null ? profile.isPersonal! : false;
//     String name =
//         profile.name != null ? profile.name.toString() : "Chưa xác định";
//     String role =
//         profile.type != null ? profile.type.toString() : "Chưa xác định";
//     // String companyName =
//     //     profile.type != null ? profile.type.toString() : "Chưa xác định";
//     String businessLicenseNumber = profile.businessLicenseNumber != null
//         ? profile.businessLicenseNumber.toString()
//         : "Chưa xác định";
//     String businessLicenseIssuedDate = profile.businessLicenseIssuedDate != null
//         ? profile.businessLicenseIssuedDate.toString()
//         : "Chưa xác định";
//     String businessLicenseIssuedBy = profile.businessLicenseIssuedBy != null
//         ? profile.businessLicenseIssuedBy.toString()
//         : "Chưa xác định";
//     String phone = profile.phoneNumber != null
//         ? profile.phoneNumber.toString()
//         : "Chưa xác định";
//     String email = profile.emailAddress != null
//         ? profile.emailAddress.toString()
//         : "Chưa xác định";
//     String street = profile.addressStreet != null
//         ? profile.addressStreet.toString()
//         : "Chưa xác định";
//     String district = profile.addressDistrictName != null
//         ? profile.addressDistrictName.toString()
//         : "Chưa xác định";
//     String ward = profile.addressWardName != null
//         ? profile.addressWardName.toString()
//         : "Chưa xác định";
//     String city = profile.addressCityName != null
//         ? profile.addressCityName.toString()
//         : "Chưa xác định";
//     String tax = profile.personalTaxNumber != null
//         ? profile.personalTaxNumber.toString()
//         : "Chưa xác định";

//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 10.0, right: 10),
//           child: Column(
//             children: [
//               vendorNameRow("Tên đơn vị", name, isPersonal),
//               if (!isPersonal) rowInLine("Tên đầy đủ của công ty", ''),
//               rowInLine("Vai trò", role),
//               rowInLine("Số điện thoại", phone),
//               rowInLine("Email", email),
//               // rowDownLine("Địa chỉ", "86 Âu Cơ , phường 8 \nQuận Tân Bình - TP.Hồ Chí Minh"),
//               if (street == "Chưa xác định" ||
//                   district == "Chưa xác định" ||
//                   ward == "Chưa xác định" ||
//                   city == "Chưa xác định") ...[
//                 rowDownLine("Địa chỉ", "Chưa xác định"),
//               ] else ...[
//                 rowDownLine("Địa chỉ", "$street, $district \n$ward - $city"),
//               ],
//               if (isPersonal) ...[
//                 rowDownLine("Mã số thuế cá nhân", tax),
//               ] else ...[
//                 rowDownLine("Số Giấy phép kinh doanh", businessLicenseNumber),
//                 rowDownLine(
//                     "Ngày cấp giấy phép kinh doanh", businessLicenseIssuedDate),
//                 rowDownLine(
//                     "Giấy phép kinh doanh cấp bởi", businessLicenseIssuedBy)
//               ],
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget vendorNameRow(String title, String userData, bool isPersonal) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0, top: 17),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   defaultText(title),
//                   Container(
//                     margin: const EdgeInsets.only(left: 15),
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: const Color(0xff1d4ed8),
//                     ),
//                     child: Center(
//                       child: Text(
//                         isPersonal == true ? 'Cá nhân' : 'Doanh nghiệp',
//                         style: const TextStyle(
//                             fontSize: 13,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                   width: getProportionateScreenWidth(180),
//                   child: userText(userData)),
//             ],
//           ),
//         ),
//         line()
//       ],
//     );
//   }

//   Widget rowInLine(String title, String userData) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0, top: 17),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               defaultText(title),
//               SizedBox(
//                   width: getProportionateScreenWidth(180),
//                   child: userText(userData)),
//             ],
//           ),
//         ),
//         line()
//       ],
//     );
//   }

//   Widget rowDownLine(
//     String title,
//     String userData,
//   ) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0, top: 17),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   defaultText(title),
//                 ],
//               ),
//               Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: userText(userData)),
//             ],
//           ),
//         ),
//         line()
//       ],
//     );
//   }

//   Widget defaultText(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//           fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
//     );
//   }

//   Widget userText(String text) {
//     return Text(
//       text,
//       textAlign: TextAlign.end,
//       maxLines: 3,
//       overflow: TextOverflow.ellipsis,
//       style: const TextStyle(
//         fontSize: 17,
//         fontWeight: FontWeight.w400,
//         height: 1.5,
//         color: Color(0xff7F7373),
//       ),
//     );
//   }

//   Widget line() {
//     return Container(
//       color: const Color(0xffD9D9D9),
//       height: 1,
//     );
//   }
// }
