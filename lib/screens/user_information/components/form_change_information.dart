// import 'package:flutter/material.dart';
// import 'package:fmp_vendor/components/default_button.dart';
// //import 'package:fmp_vendor/test_navigator_bottom_bar.dart';


// import '../../../../constants.dart';
// //import '../../../../helper/keyboard.dart';
// import '../../../../size_config.dart';


// class FormChangeInformation extends StatefulWidget {
//   const FormChangeInformation({super.key});


//   @override
//   State<FormChangeInformation> createState() => _FormChangeInformationState();
// }

// class _FormChangeInformationState extends State<FormChangeInformation> {
  
//   String? name;
//   String? email;
//   String? password;
//   String? phone;
//   bool obscureText = true;
//   String? storename;
  

//   @override
//   Widget build(BuildContext context) {
//     //double screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//         decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(
//             getProportionateScreenHeight(20),
//           ),
//         ),
//       ),
      
//         child: Form(
          
//           //key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//              Container(
//               width: double.infinity, 
//               alignment: Alignment.topLeft, // Căn lề văn bản về trái và trên cùng
//               child: Text(
//                 'Họ và tên',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.01,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.left, 
//               ),
//             ),
//             SizedBox(height: getProportionateScreenHeight(1)),
//             NameFormField(),
//             SizedBox(height: getProportionateScreenHeight(20)),
//             Container(
//               width: double.infinity, 
//               alignment: Alignment.topLeft, // Căn lề văn bản về trái và trên cùng
//               child: Text(
//                 'Email',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.01,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.left, 
//               ),
//             ),
//             SizedBox(height: getProportionateScreenHeight(1)),
            
//             EmailFormField(),
//             SizedBox(height: getProportionateScreenHeight(20)),
//             Container(
//               width: double.infinity, 
//               alignment: Alignment.topLeft, // Căn lề văn bản về trái và trên cùng
//               child: Text(
//                 'Số điện thoại',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.01,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.left, 
//               ),
//             ),
//             SizedBox(height: getProportionateScreenHeight(1)),
//             PhoneNumberFormField(),
//             SizedBox(height: getProportionateScreenHeight(20)),
//             Container(
//               width: double.infinity, 
//               alignment: Alignment.topLeft, // Căn lề văn bản về trái và trên cùng
//               child: Text(
//                 'Tên cửa hàng',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.01,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.left, 
//               ),
//             ),
//             SizedBox(height: getProportionateScreenHeight(1)),
//             StortNameFormField(),
//             SizedBox(height: getProportionateScreenHeight(20)),
//             Container(
//               width: double.infinity, 
//               alignment: Alignment.topLeft, // Căn lề văn bản về trái và trên cùng
//               child: Text(
//                 'Mật khẩu',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.01,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.left, 
//               ),
//             ),
//             SizedBox(height: getProportionateScreenHeight(1)),
//             PasswordFormField(),
//             SizedBox(height: getProportionateScreenHeight(50)),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: DefaultButton(
 
//                 text: 'Lưu thay đổi',
//                 press: () async {}
//             ),
            
//             ),
            
            
//           ],
//           ),
//           ),
        
//     );
//   }
  
//   TextFormField NameFormField(){
//     return TextFormField(
//       keyboardType: TextInputType.name,
//       onSaved: (newValue) => name = newValue,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return kNamelNullError;
//         } 
//         return null;
//       },
//       style: TextStyle(
//         fontSize: getProportionateScreenHeight(18),
//         color: Colors.black,
//       ),
//       decoration: const InputDecoration(
//         hintText: "Họ và tên",
        
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }
//    TextFormField PhoneNumberFormField(){
//     return TextFormField(
//       keyboardType: TextInputType.phone,
//       onSaved: (newValue) => phone = newValue,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return kPhoneNumberNullError;
//         } 
//         return null;
//       },
//       style: TextStyle(
//         fontSize: getProportionateScreenHeight(18),
//         color: Colors.black,
//       ),
//       decoration: const InputDecoration(
//         hintText: "Số điện thoại",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }

//   TextFormField StortNameFormField(){
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       onSaved: (newValue) => storename = newValue,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return kNameStoreNullError;
//         } 
//         return null;
//       },
//       style: TextStyle(
//         fontSize: getProportionateScreenHeight(18),
//         color: Colors.black,
//       ),
//       decoration: const InputDecoration(
//         hintText: "Tên cửa hàng",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }


//   TextFormField EmailFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => email = newValue,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return kEmailNullError;
//         } else if (!emailValidatorRegExp.hasMatch(value)) {
//           return kInvalidEmailError;
//         }
//         return null;
//       },
//       style: TextStyle(
//         fontSize: getProportionateScreenHeight(18),
//         color: Colors.black,
//       ),
//       decoration: const InputDecoration(
//         hintText: "Email",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }

//   TextFormField PasswordFormField() {
//     return TextFormField(
//       obscureText: obscureText,
//       onSaved: (newValue) => password = newValue,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return kPassNullError;
//         }
//         if (value.length < 8) {
//           return kShortPassError;
//         }
//         return null;
//       },
//       style: TextStyle(
//         fontSize: getProportionateScreenHeight(18),
//         color: Colors.black,
//       ),
//       decoration: InputDecoration(
//         hintText: "Mật khẩu",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: Padding(
//           padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
//           child: IconButton(
//             onPressed: () {
//               setState(() {
//                 obscureText = !obscureText;
//               });
//             },
//             icon: obscureText == true
//                 ? const Icon(Icons.visibility_off)
//                 : const Icon(Icons.visibility),
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
  
//    SnackBar SnackBarSaveSuccess() {
//     return SnackBar(
//       duration: const Duration(seconds: 2),
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       content: Container(
//         padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//         height: getProportionateScreenHeight(50),
//         width: SizeConfig.screenWidth * 0.6,
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             const Icon(
//               Icons.check_circle_outline,
//               color: Colors.white,
//             ),
//             SizedBox(width: getProportionateScreenWidth(25)),
//             Text(
//               'Lưu thành công',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: getProportionateScreenWidth(15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }