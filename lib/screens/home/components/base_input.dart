import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/all_product/all_product_screen.dart';
import 'package:ecommerce_app_mobile/security_user/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../size_config.dart';

class InputHome extends StatelessWidget {
  const InputHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(5),
          getProportionateScreenHeight(38),
          getProportionateScreenWidth(0),
          getProportionateScreenHeight(30)),
      child: Row(
        children: [
          Container(
            width: getProportionateScreenWidth(300),
            height: getProportionateScreenHeight(40),
            child: TextFormField(
              onTapOutside: (event) {
                KeyboardUtil.hideKeyboard(context);
              },
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllProductScreen()),
                );
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.colorD1D1D6,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColor.color8E8E93),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  // borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColor.color35A5F1,
                  size: 25,
                )
              ),
              cursorColor: Colors.black,
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(17),
            ),

          Container(
            width: getProportionateScreenWidth(55),
            height: getProportionateScreenHeight(55),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              //color: Colors.black
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: AppColor.color35A5F1,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}