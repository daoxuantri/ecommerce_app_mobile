
import 'package:ecommerce_app_mobile/model/related_product/product_related_model.dart';
import 'package:ecommerce_app_mobile/screens/home/components/product_card.dart';
import 'package:ecommerce_app_mobile/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';


class ProductList extends StatelessWidget {
  final List<ProductRelatedModel> products;
  final ProductBloc productBloc;
  const ProductList({super.key, required this.products, required this.productBloc});

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
                    productBloc.add(ProductRelatedClickedEvent(productId: products[index].sId.toString()));
                  },
                  child: ProductCard(
                    images: (products[index].images != null && products[index].images!.isNotEmpty) 
                        ? products[index].images![0] 
                        : 'assets/images/notfoundimages.jpg',
                    name: products[index].name.toString(),
                    rating: products[index].rating,
                    initialprice: products[index].initPrice ?? 0,
                    price: products[index].discPrice ?? products[index].initPrice ?? 0,
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
