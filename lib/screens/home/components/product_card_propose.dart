import 'package:ecommerce_app_mobile/screens/home/components/favouriteproduct.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import '../bloc/home_bloc.dart';



class ProductCardPropose extends StatelessWidget {
  final String? name; 
  final String image;
  final int ?price;
  final int ? initialprice;
  final double ?rating;
  final HomeBloc homeBloc;
  final String id;
  const ProductCardPropose({
    super.key,
    this.name, 
    required this.image,
    required this.homeBloc,
    required this.id,  this.price, this.rating, this.initialprice,
  });
  

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(price ?? 0);
    String formattedOldPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(initialprice ?? 0);
    
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
                      '$formattedPrice',
                      style: TextStyle(
                        color: Color.fromARGB(164, 183, 16, 16),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          // Chỉ hiển thị giá cũ nếu có giá giảm
          if (initialprice != null && initialprice! > price!)
            Positioned(
              left: 10,
              top: 233,
              child: SizedBox(
                width: 600,
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        '$formattedOldPrice',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            left: 150,
            top: 260,
            child: FavouriteProduct(
            ),
          ),
          Positioned(
            left: 10,
            top: 260,
            child: Row(
              children: List.generate(5, (index) {
                if (index < (rating?.floor() ?? 0)) {
                  // Hiển thị ngôi sao đầy đủ nếu index nhỏ hơn rating làm tròn xuống
                  return Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20,
                  );
                } else if (index < (rating ?? 0) && (rating ?? 0) - index >= 0.5) {
                  // Hiển thị nửa ngôi sao nếu index nằm trong khoảng rating thập phân
                  return Icon(
                    Icons.star_half,
                    color: Colors.orange,
                    size: 20,
                  );
                } else {
                  // Hiển thị ngôi sao trống nếu không đạt điều kiện trên
                  return Icon(
                    Icons.star_border,
                    color: Colors.grey,
                    size: 20,
                  );
                }
              }),
            ),
          )

        ],
      ),
    );
  }
}
