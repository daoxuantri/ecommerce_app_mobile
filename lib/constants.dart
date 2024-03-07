import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFF97616);
const kLabelColor = Color.fromARGB(255, 141, 145, 138);
const backgroundcolor = Color.fromARGB(255, 240, 238, 238);


const kPrimaryLightColor = Color.fromARGB(255, 238, 12, 12);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF0C2781),
    Color(0xFF0D2A8A),
    Color(0xFF1C3686),
    Color(0xFF2947A2),
    Color(0xFF475EAF),
    Color(0xFF2C4BAD),
    Color(0xFF1C3686),
    Color(0xFF0D2A8A),
    Color(0xFF0C2781)
  ],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp phoneValidatorRegExp = RegExp(r"^[0-9]{10}$");
const String kEmailNullError = "Nhập email của bạn*";
const String kInvalidEmailError = "Hãy nhập email hợp lệ";
const String kPassNullError = "Nhập mật khẩu của bạn*";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Mật khẩu không khớp";
const String kNamelNullError = "Nhập tên của bạn";
const String kPhoneNumberNullError = "Nhập số điện thoại của bạn";
const String kInvalidPhoneNumberError = "Hãy nhập số điện thoại hợp lệ";
const String kNameStoreNullError = "Nhập tên cửa hàng của bạn";
const String kPersonalTaxNullError = "Nhập mã số thuế cá nhân của bạn";
const String kBusinessLicenseNumberNullError = "Nhập Số đăng ký doanh nghiệp của bạn";
const String kBusinessLicenseIssuedDateError = "Chọn ngày cấp phép";
const String kBusinessLicenseIssuedBy = "Nhập người cung cấp giấy phép doanh nghiệp";
const String kAddressNullError = "Nhập địa chỉ cụ thể của bạn";

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: kPrimaryLightColor,
    ),
    gapPadding: 10,
  );
}

OutlineInputBorder outlineInputFocusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: kPrimaryLightColor,
      width: 2,
    ),
    gapPadding: 10,
  );
}

OutlineInputBorder outlineInputBorder_error() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: kPrimaryColor,
    ),
  );
}

OutlineInputBorder outlineInputFocusedBorder_error() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: kPrimaryColor,
      width: 2,
    ),
  );
}
