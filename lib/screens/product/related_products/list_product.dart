
import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
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
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  // onTap: () {
                  //   homeBloc.add(HomeProductClickedEvent(productId: products[index].sId.toString()));
                  // },
                  child: ProductCard(
                    images: (products[index].images != null && products[index].images!.isNotEmpty) 
                        ? products[index].images![0] 
                        : 'assets/images/notfoundimages.jpg',
                    name: products[index].name.toString(),
                    rating: products[index].rating
                    //isTap: products[index].isTap,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
