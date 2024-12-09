import 'package:flutter/material.dart';

import '../../../size_config.dart';

class AddressHeader extends StatefulWidget implements PreferredSizeWidget {
  const AddressHeader({super.key});

  @override
  State<AddressHeader> createState() => _AddressHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AddressHeaderState extends State<AddressHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // thay đổi màu status bar
      // systemOverlayStyle:  const SystemUiOverlayStyle(
      //   // Status bar color
      //   statusBarColor: Colors.white,
      //   // Status bar brightness (optional)
      //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
      // ),

      //toolbarHeight: 60,
      //backgroundColor: const Color(0xfffffffF),
      title: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(45)),
        child:  const Text(
          "Địa chỉ của tôi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500, 
          ),
          
        ),
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
