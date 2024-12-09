import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

class NoProductFilter extends StatelessWidget {
  const NoProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getProportionateScreenHeight(80),),
            Image.asset(width: getProportionateScreenWidth(150),
            height: getProportionateScreenHeight(150),
              'assets/images/empty.png'),
            SizedBox(height: getProportionateScreenHeight(15),),
            Text('Không tìm thấy sản phẩm nào.'),
            SizedBox(height: getProportionateScreenHeight(15),),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NavigatorBottomBarHome(currentIndex: 1), // Giả sử giỏ hàng là chỉ số 2
                ),
              );
              },
              child: Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                    color: Colors.red, // Màu đỏ cho nút Đồng ý
                    borderRadius: BorderRadius.circular(8),
                   ),
                   child: const Text(
                    "Xem danh mục khác",
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    ),
                    ),),
            )
            
      
      
      
          ],
        )
      ),
    );
  }
}