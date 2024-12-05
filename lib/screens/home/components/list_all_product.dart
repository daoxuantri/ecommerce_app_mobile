import 'package:ecommerce_app_mobile/model/home/ratings/rating_product.dart';
import 'package:ecommerce_app_mobile/screens/home/bloc/home_bloc.dart';
import 'package:ecommerce_app_mobile/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

class ListAllProduct extends StatelessWidget {
  final List<RatingProductDataModel> ratingProducts;
  final HomeBloc homeBloc;

  const ListAllProduct({super.key, required this.ratingProducts, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 15),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Hiển thị 2 sản phẩm trên một hàng
              mainAxisSpacing: 10, // Khoảng cách giữa các hàng
              crossAxisSpacing: 5, // Khoảng cách giữa các cột
              childAspectRatio: 0.65, // Tỉ lệ giữa chiều cao và chiều rộng của item
            ),
            itemCount: ratingProducts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // homeBloc.add(
                  //   HomeProductClickedEvent(
                  //     productId: products[index].sId.toString(),
                  //   ),
                  // );

                  homeBloc.add(HomeProductClickedEvent(productId: ratingProducts[index].sId.toString()));
                },
                child: ProductCard(
                  images: (ratingProducts[index].images != null && ratingProducts[index].images!.isNotEmpty) 
                        ? ratingProducts[index].images![0] 
                        : 'assets/images/notfoundimages.jpg',
                  name: ratingProducts[index].name,
                  price: (ratingProducts[index].variants != null &&
                          ratingProducts[index].variants!.isNotEmpty &&
                          ratingProducts[index].variants![0].variantschild != null &&
                          ratingProducts[index].variants![0].variantschild!.isNotEmpty)
                      ? (ratingProducts[index].variants![0].variantschild![0].price?.discount ??
                        ratingProducts[index].variants![0].variantschild![0].price?.initial ?? 0)
                      : 0,
                  rating: ratingProducts[index].rating,
                  initialprice: (ratingProducts[index].variants != null &&
                              ratingProducts[index].variants!.isNotEmpty &&
                              ratingProducts[index].variants![0].variantschild != null &&
                              ratingProducts[index].variants![0].variantschild!.isNotEmpty)
                    ? (ratingProducts[index].variants![0].variantschild![0].price?.initial ?? 0)
                    : 0,
                  
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}