import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/all_product/all_product_screen.dart';
import 'package:ecommerce_app_mobile/screens/search/search_screen.dart';
import 'package:ecommerce_app_mobile/security_user/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../size_config.dart';

class InputHome extends StatefulWidget {
  const InputHome({super.key});

  @override
  _InputHomeState createState() => _InputHomeState();
}

class _InputHomeState extends State<InputHome> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(0),
          getProportionateScreenHeight(38),
          getProportionateScreenWidth(15),
          getProportionateScreenHeight(35)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenWidth(300),
            height: getProportionateScreenHeight(40),
            child: TextFormField(
              controller: _searchController,
              onTapOutside: (event) {
                KeyboardUtil.hideKeyboard(context);
              },
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(keyword: value),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Vui lòng nhập từ khóa tìm kiếm')),
                  );
                }
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
                  borderRadius: BorderRadius.circular(30),),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColor.color35A5F1,
                  size: 25,
                ),
              ),
              cursorColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}