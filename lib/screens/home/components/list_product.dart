
import 'package:ecommerce_app_mobile/model/home/categories/categories.dart';
import 'package:ecommerce_app_mobile/model/home/products/products.dart';
import 'package:ecommerce_app_mobile/screens/home/bloc/home_bloc.dart';
import 'package:ecommerce_app_mobile/screens/home/components/product_card.dart'; 
import 'package:flutter/material.dart';


class ProductList extends StatelessWidget {
  final List<ProductDataModel> products;
  final HomeBloc homeBloc;
  const ProductList({super.key, required this.products, required this.homeBloc});

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
                  onTap: () {
                    homeBloc.add(HomeProductClickedEvent(productId: products[index].sId.toString()));
                  },
                  child: ProductCard(
                    images: (products[index].images != null && products[index].images!.isNotEmpty) 
                        ? products[index].images![0] 
                        : 'assets/images/notfoundimages.jpg',
                    name: products[index].name.toString(),
                    price: (products[index].variants != null &&
                        products[index].variants!.isNotEmpty &&
                        products[index].variants![0].variantschild != null &&
                        products[index].variants![0].variantschild!.isNotEmpty)
                    ? (products[index].variants![0].variantschild![0].price?.discount ??
                      products[index].variants![0].variantschild![0].price?.initial ?? 0)
                    : 0,
                    rating: products[index].rating,
                    initialprice: (products[index].variants != null &&
                              products[index].variants!.isNotEmpty &&
                              products[index].variants![0].variantschild != null &&
                              products[index].variants![0].variantschild!.isNotEmpty)
                    ? (products[index].variants![0].variantschild![0].price?.initial ?? 0)
                    : 0,

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
