
import 'package:ecommerce_app_mobile/model/home/categories.dart';
import 'package:ecommerce_app_mobile/model/home/products.dart';
import 'package:ecommerce_app_mobile/screens/home/components/product_card.dart'; 
import 'package:flutter/material.dart';


class ProductList extends StatelessWidget {
  final List<ProductDataModel> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              int currentIndex = index;
              return Container(
                margin: EdgeInsets.only(
                    right: currentIndex == products.length - 1
                        ? 20
                        : 0),
                padding: const EdgeInsets.only(bottom: 20),
                child: ProductCard(
                  images: (products[index].images != null && products[index].images!.isNotEmpty) 
                      ? products[index].images![0] 
                      : 'assets/images/notfoundimages.jpg',
                  name: products[index].name.toString(),
                  price: products[index].price,
                  //isTap: products[index].isTap,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
