import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import '../bloc/home_bloc.dart';



class ProductCardPropose extends StatelessWidget {
  final String? name; 
  final String image;
  final int ?price;
  final HomeBloc homeBloc;
  final String id;
  const ProductCardPropose({
    super.key,
    this.name, 
    required this.image,
    required this.homeBloc,
    required this.id, required this.price,
  });
  

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(price);

    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: SizeConfig.screenWidth * 0.44,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: Image.network(
                image,
                //width: 112,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 154,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10,20,20,20),
              child: Text(
                '$name',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top:215,
            child: SizedBox(
              width: 600,
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      'Giá: $formattedPrice',
                      style: TextStyle(
                        color: Color.fromARGB(164, 183, 16, 16),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          // Positioned(
          //   left: 100,
          //   top: 220,
          //   child: SizedBox(
          //     width: 90,
          //     height: 60,
          //     child: Stack(
          //       children: [
          //         const Positioned(
          //           left: 0,
          //           top: 0,
          //           child: Text(
          //             'Đơn vị tính',
          //             style: TextStyle(
          //               color: Color(0xA5222222),
          //               fontSize: 17,
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //         ),
          //         Positioned(
          //           left: 0,
          //           top: 26,
          //           child: Text(
          //             '$unit',
          //             style: const TextStyle(
          //               color: Colors.black,
          //               fontSize: 17,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 241,
          //   top: 206,
          //   child: FavouriteFlower(
          //     isTap: isTap,
          //   ),
          // ),
          // Positioned(
          //   left: 245,
          //   top: 160,
          //   child: ColorFlower(
          //     colorFlower: flowerColor,
          //   ),
          // ),
        ],
      ),
    );
  }
}
