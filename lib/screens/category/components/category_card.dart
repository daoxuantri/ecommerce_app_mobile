import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {
  final String? name;
  final String? images;
  final String id ;
  final VoidCallback press;
  const CategoryCard({super.key, required this.name, required this.images, required this.press, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            width: getProportionateScreenWidth(80),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '$images',
                fit: BoxFit.cover, 
                height: getProportionateScreenWidth(70),
                width: getProportionateScreenWidth(70),
              ),
            ),
        
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$name',
            style: const TextStyle(
              fontSize: 12 ,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF Pro Text'
            ),
          )
        ],
      ),
    );
  }
}
