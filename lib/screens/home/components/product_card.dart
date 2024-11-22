import 'package:ecommerce_app_mobile/screens/home/components/favouriteproduct.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  


class ProductCard extends StatelessWidget {
  final String? name;
  final int? price;
  final int? rating;
  final bool isTap;
  final String images;

  const ProductCard(
      {super.key,
        this.name,
        this.price,
        this.isTap = false, required this.images, this.rating});

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(price);
    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: SizeConfig.screenWidth * 0.44,
      //height: SizeConfig.screenHeight * 0.4,
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
                  color: Color(0xFFFFCADD)
              ),
              child: Image.network(
                images,
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
            top: 215,
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
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
              children: List.generate(5, (index){
                return Icon(
                  Icons.star,
                  color: index < (rating ?? 0) ? Colors.orange : Colors.grey,
                  size: 20,
                );
              }) 
            )
          ),
        ],
      ),
    );
  }
}
